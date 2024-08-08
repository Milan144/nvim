return {
    'nvim-lualine/lualine.nvim',
    opts = function()
      require("lualine").setup({
        options = {
            theme = 'dracula-nvim'
        },
      })     
    end
}
    