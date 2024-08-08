return {
    'folke/zen-mode.nvim',
    keys = {{
        '<leader>zm',
        '<cmd>ZenMode<CR>',
        desc = '[Z]en [M]ode'
    }},
    opts = {
        plugins = {
            alacritty = {
                enabled = true,
                font = '14'
            }
        }
    }
}