return {
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format {
                        async = true,
                        lsp_fallback = true,
                    }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                return false
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'black' },
                javascript = { 'prettier' },
                php = { { 'phpactor', 'format' } },
            },
        },
    },
    {
        { -- Add indentation guides even on blank lines
            'lukas-reineke/indent-blankline.nvim',
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help ibl`
            main = 'ibl',
            opts = {},
        },
    },
    {
        { -- Linting
            'mfussenegger/nvim-lint',
            event = { 'BufReadPre', 'BufNewFile' },
            config = function()
                local lint = require 'lint'
                lint.linters_by_ft = {
                    markdown = { 'markdownlint' },
                }

                -- To allow other plugins to add linters to require('lint').linters_by_ft,
                -- instead set linters_by_ft like this:
                -- lint.linters_by_ft = lint.linters_by_ft or {}
                -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
                --
                -- However, note that this will enable a set of default linters,
                -- which will cause errors unless these tools are available:
                -- {
                --   clojure = { "clj-kondo" },
                --   dockerfile = { "hadolint" },
                --   inko = { "inko" },
                --   janet = { "janet" },
                --   json = { "jsonlint" },
                --   markdown = { "vale" },
                --   rst = { "vale" },
                --   ruby = { "ruby" },
                --   terraform = { "tflint" },
                --   text = { "vale" }
                -- }
                --
                -- You can disable the default linters by setting their filetypes to nil:
                -- lint.linters_by_ft['clojure'] = nil
                -- lint.linters_by_ft['dockerfile'] = nil
                -- lint.linters_by_ft['inko'] = nil
                -- lint.linters_by_ft['janet'] = nil
                -- lint.linters_by_ft['json'] = nil
                -- lint.linters_by_ft['markdown'] = nil
                -- lint.linters_by_ft['rst'] = nil
                -- lint.linters_by_ft['ruby'] = nil
                -- lint.linters_by_ft['terraform'] = nil
                -- lint.linters_by_ft['text'] = nil

                -- Create autocommand which carries out the actual linting
                -- on the specified events.
                local lint_augroup = vim.api.nvim_create_augroup('lint', {
                    clear = true,
                })
                vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                    group = lint_augroup,
                    callback = function()
                        lint.try_lint()
                    end,
                })
            end,
        },
    },
    {
        'wakatime/vim-wakatime',
        lazy = false,
    },
    {
        'chrisgrieser/nvim-rip-substitute',
        config = function()
            require('rip-substitute').setup {
                -- Add any additional configuration options here
                on_open = function()
                    -- Ensure the buffer name is unique
                    local buf_name = 'RipSubstitute'
                    local buf_exists = vim.fn.bufexists(buf_name) == 1
                    if buf_exists then
                        vim.cmd('bwipeout ' .. buf_name)
                    end
                end,
            }
        end,
    },
    { 'ThePrimeagen/vim-be-good' },
    {
        'MeanderingProgrammer/markdown.nvim',
        event = 'BufRead',
        main = 'render-markdown',
        opts = {},
        name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    },
    {
        'tweekmonster/startuptime.vim',
        cmd = { 'StartupTime' },
        keys = { {
            '<leader>st',
            '<cmd>StartupTime<CR>',
            desc = '[S]tartup [T]ime',
        } },
    },
    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.ai').setup {
                n_lines = 500,
            }
            require('mini.surround').setup()
            local statusline = require 'mini.statusline'
            statusline.setup {
                use_icons = vim.g.have_nerd_font,
            }
            statusline.section_location = function()
                return '%2l:%-2v'
            end
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require('nvim-autopairs').setup {}
        end,
    }, 
}
