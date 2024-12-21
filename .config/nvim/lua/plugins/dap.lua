return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
        end,
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
}
