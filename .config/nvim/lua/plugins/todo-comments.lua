return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require("todo-comments").setup()

        local function insert_comment(tag)
            local line = vim.api.nvim_win_get_cursor(0)[1]
            local commentstring = vim.bo.commentstring
            local comment_text = tag .. ": "
            local comment_prefix = commentstring:match("^(.*)%%s") or "#"
            local commented_line = comment_prefix .. " " .. comment_text

            vim.api.nvim_buf_set_lines(0, line - 1, line - 1, false, { commented_line })

            vim.api.nvim_win_set_cursor(0, { line, #commented_line })
            vim.cmd("startinsert")

            vim.api.nvim_feedkeys(" ", "n", false)
        end

        local keymaps = {
            td = "TODO",
            th = "HACK",
            tw = "WARN",
            tp = "PERF",
            tt = "TEST",
            tf = "FIX",
            tn = "NOTE"
        }

        for key, tag in pairs(keymaps) do
            vim.keymap.set("n", "<leader>" .. key, function()
                insert_comment(tag)
            end, { desc = "Insert " .. tag })
        end
    end
}
