return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = true,
            },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            {
                'j-hui/fidget.nvim',
                opts = {},
            },
            {
                'folke/lazydev.nvim',
                ft = 'lua',
                opts = {
                    library = { {
                        path = 'luvit-meta/library',
                        words = { 'vim%.uv' },
                    } },
                },
            },
            {
                'Bilal2453/luvit-meta',
                lazy = true,
            },
        },
        config = function()
            -- LSP configuration
            -- (Paste the LSP configuration code here)
        end,
    },
    {
        'VidocqH/lsp-lens.nvim',
        config = function()
            require('lsp-lens').setup {}
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
                dependencies = {},
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },
        config = function()
            -- nvim-cmp configuration
            -- (Paste the nvim-cmp configuration code here)
        end,
    },
}
