-- PLUGIN CONFIGURATION
require('lazy').setup {
    'tpope/vim-sleuth',
    {
        { import = 'plugins.utility' },
        { import = 'plugins.lsp' },
        { import = 'plugins.git' },
        { import = 'plugins.treesitter' },
        { import = 'plugins.ui' },
        { import = 'plugins.colorscheme' },
    },
}
