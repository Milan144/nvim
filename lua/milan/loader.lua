-- Loading plugins
require('lazy').setup {
    'tpope/vim-sleuth',
    {
        { import = 'milan.plugins.editor' },
        { import = 'milan.plugins.git' },
        { import = 'milan.plugins.lsp' },
        { import = 'milan.plugins.ui' },
        { import = 'milan.plugins.ai' },
    },
}
