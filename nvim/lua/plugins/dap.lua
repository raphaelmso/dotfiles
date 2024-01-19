return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      local js_based_languages = { "javascript", "typescript", "typescriptreact", "javascriptreact" }
      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
          },
          {

            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = "Enter URL: ",
                  default = "http://localhost:3000",
                }, function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            webRoot = "${workspaceFolder}",
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
          },
        }
      end
    end,
  },
  {
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      version = "1.*",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = function()
        require("dap-vscode-js").setup({
          node_path = "node",
          debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
          log_file_path = "~/.cache/dap_vscode_js.log",
          log_file_level = vim.log.levels.INFO,
        })
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

        vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<cr>")
        vim.keymap.set("n", "<leader>de", ":lua require('dapui').eval()<cr>")
        vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<cr>")
        vim.keymap.set(
          "n",
          "<leader>dB",
          ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
        )
        vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>")
        vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<cr>")
        vim.keymap.set("n", "<F10>", ":lua require('dap').step_over()<cr>")
        vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<cr>")
        vim.keymap.set("n", "<F12>", ":lua require('dap').step_out()<cr>")
        vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>")
        vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>")
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
  },
}
