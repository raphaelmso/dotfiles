return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps'
        },
    },
    opts = {
        icons = {
            mappings = false,
        },
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
}
