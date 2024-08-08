return {
    'neovim/nvim-lspconfig',
    dependencies = {{
        'williamboman/mason.nvim',
        config = true
    }, 'williamboman/mason-lspconfig.nvim', 'WhoIsSethDaniel/mason-tool-installer.nvim', {
        'j-hui/fidget.nvim',
        opts = {}
    }, {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {{
                path = 'luvit-meta/library',
                words = {'vim%.uv'}
            }}
        }
    }, {
        'Bilal2453/luvit-meta',
        lazy = true
    }},
    config = function()
        local lspconfig = require('lspconfig')
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup()
        mason_lspconfig.setup {
            ensure_installed = {'intelephense', -- PHP
            'tsserver', -- JavaScript and TypeScript
            'vuels', -- Vue.js
            'cssls', -- CSS
            'tailwindcss', -- Tailwind CSS
            'emmet_ls', -- Emmet (HTML, CSS, etc.)
            'twiggy_language_server' -- Twig
            }
        }

        local servers = {
            intelephense = {},
            tsserver = {},
            vuels = {},
            cssls = {},
            tailwindcss = {},
            emmet_ls = {},
            twiggy_language_server = {}
        }

        for server, config in pairs(servers) do
            lspconfig[server].setup {
                on_attach = function(client, bufnr)
                    -- Keybindings and other settings here if needed
                end,
                settings = config
            }
        end
    end
}
