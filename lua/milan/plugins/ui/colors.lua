return {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
        require('rose-pine').setup {
            transparent_background = true, -- disables setting the background color.
        }

        vim.cmd.colorscheme 'rose-pine'
    end,
}
