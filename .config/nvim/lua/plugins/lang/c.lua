return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
        }
        dap.configurations.c = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.getcwd() .. '/debug_bin'
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }


        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local function compile_debug_bin()
                    local filename = vim.fn.expand("%")
                    local compile_command = string.format("gcc %s -o main", filename)
                    local compile_result = vim.fn.system(compile_command)

                    if vim.v.shell_error == 0 then
                        vim.cmd('split')

                        local bufnr = vim.api.nvim_get_current_buf()
                        vim.api.nvim_buf_set_name(bufnr, "bin_output")

                        local run_command = "./main"
                        local run_result = vim.fn.system(run_command)

                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(run_result, "\n"))
                        vim.bo[bufnr].modifiable = false
                        vim.bo[bufnr].filetype = "text"
                    else
                        vim.api.nvim_err_writeln("Compilation failed:\n" .. compile_result)
                    end
                end

                local function compile_bin()
                    vim.cmd("silent! tag")
                    local filename = vim.fn.expand("%")
                    local compile_command = string.format("gcc %s -o main", filename)
                    local compile_result = vim.fn.system(compile_command)

                    if vim.v.shell_error == 0 then
                        vim.cmd('split')

                        local new_bufnr = vim.api.nvim_create_buf(false, true)
                        local run_command = "./main"
                        local run_result = vim.fn.system(run_command)

                        vim.api.nvim_buf_set_lines(new_bufnr, 0, -1, false, vim.split(run_result, "\n"))
                        vim.api.nvim_buf_set_option(new_bufnr, 'modifiable', false)
                        vim.api.nvim_buf_set_option(new_bufnr, 'filetype', 'text')

                        vim.cmd("buffer " .. new_bufnr)

                        local window_height = vim.api.nvim_win_get_height(0)
                        local new_height = math.floor(window_height * 0.5)

                        vim.api.nvim_win_set_height(0, new_height)
                    else
                        vim.api.nvim_err_writeln("Compilation failed:\n" .. compile_result)
                    end
                end



                local filetype = vim.bo[args.buf].filetype
                if filetype == "c" then
                    vim.keymap.set(
                        "n",
                        "<leader>dB",
                        ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
                        { desc = "Breakpoint Condition" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>db",
                        ":lua require('dap').toggle_breakpoint()<cr>",
                        { desc = "Toggle Breakpoint" }
                    )

                    vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<cr>", { desc = "Step Over" })
                    vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<cr>", { desc = "Step Into" })
                    vim.keymap.set("n", "<leader>du", ":lua require('dap').step_out()<cr>", { desc = "Step Out" })
                    vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>", { desc = "Run Last" })
                    vim.keymap.set("n", "<leader>dq", ":lua require('dap').terminate()<cr>", { desc = "Terminate" })

                    vim.keymap.set("n", "<leader>dr", ":lua require('dap').continue()<cr>", { desc = "Run Debug" })
                    vim.keymap.set(
                        "n",
                        "<leader>dc",
                        compile_debug_bin,
                        { desc = "Compile to debug_bin", buffer = args.buf }
                    )

                    vim.keymap.set("n", "<leader>cr", compile_bin, { desc = "Run" })
                end
            end,
        })
    end

}
