return {{
    'NTBBloodbath/doom-one.nvim',
    priority = 1000,
    init = function()
        vim.cmd.colorscheme 'doom-one'
        vim.cmd.hi 'Comment gui=none'
    end,
}}
