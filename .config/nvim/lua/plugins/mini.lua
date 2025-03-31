return {
    {
        'echasnovski/mini.pairs',
        version = false,
        event = "InsertEnter",
        config = function()
            require('mini.pairs').setup()
        end
    },
    {

        "echasnovski/mini.surround",
        event = "BufReadPre",
        config = function ()
            require('mini.surround').setup()
        end
    },
    {
        "echasnovski/mini.icons",
        event = "VeryLazy",
        config = function()
            require('mini.icons').setup()
        end
    },
    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        config = function()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    fixme     = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
                    todo      = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
                    note      = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
                    hack      = { pattern = 'HACK', group = 'MiniHipatternsHack' },
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                }
            })
        end
    }

}
