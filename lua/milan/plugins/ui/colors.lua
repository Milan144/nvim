return {
    'Mofiqul/dracula.nvim',
    name = 'dracula',
    config = function()
        require('dracula').setup {
            transparent_bg = true, -- default false  
        }
        -- vim.cmd 'colorscheme rose-pine'
        -- vim.cmd("colorscheme rose-pine-main")
        vim.cmd("colorscheme dracula")
        -- vim.cmd("colorscheme rose-pine-dawn")
    end,
}
