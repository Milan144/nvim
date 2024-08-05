return {{
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
        require('which-key').setup()
        require('which-key').add {{
            '<leader>c',
            group = '[C]ode'
        }, {
            '<leader>d',
            group = '[D]ocument'
        }, {
            '<leader>r',
            group = '[R]ename'
        }, {
            '<leader>s',
            group = '[S]earch'
        }, {
            '<leader>w',
            group = '[W]orkspace'
        }, {
            '<leader>t',
            group = '[T]oggle'
        }, {
            '<leader>h',
            group = 'Git [H]unk',
            mode = {'n', 'v'}
        }}
    end
}, {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim', {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end
    }, {'nvim-telescope/telescope-ui-select.nvim'}, {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font
    }},
    config = function()
        -- Telescope configuration
        -- (Paste the Telescope configuration code here)
    end
}, {
    'NTBBloodbath/doom-one.nvim',
    priority = 1000,
    init = function()
        vim.cmd.colorscheme 'doom-one'
        vim.cmd.hi 'Comment gui=none'
    end
}, {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim'},
    cmd = 'Neotree',
    keys = {{
        '\\',
        ':Neotree reveal<CR>',
        desc = 'NeoTree reveal'
    }, {
        '<leader>e',
        ':Neotree toggle<CR>',
        desc = 'Toggle NeoTree'
    }},
    opts = {
        filesystem = {
            filtered_items = {
                visible = true
            },
            window = {
                mappings = {
                    ['\\'] = 'close_window'
                }
            }
        }
    }
}, {
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
}, {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {"RchrdAriza/nvim-web-devicons"},
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local time = os.date("%H:%M")
        local date = os.date("%a %d %b")
        local v = vim.version()
        local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

        -- Set header
        dashboard.section.header.val =
            {"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢠⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢠⣿⣿⣿⣿⣄⢀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣦⣀⣠⠴⠚⢛⣛⣭⣥⣽⣶⣶⣶⣶⣶⣶⣶⣶⣴⣮⣭⣛⣒⡢⢤⣄⣀⡀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⡿⠟⣃⣀⣴⢶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡭⢟⣵⣿⣿⣿⣿⣿⣿⠇⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡿⠛⣹⣶⠿⣿⣿⣷⡿⠿⢿⣿⠿⠛⠛⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣻⣴⣿⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⢲⣶⣶⣶⣶⡾⣉⣤⣾⣿⣿⣿⠿⣿⣿⣋⣙⣿⡇⢀⠀⠰⣿⡷⠀⢹⣿⠛⠛⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠹⣿⠟⣋⣵⣿⢏⣾⣿⣿⢻⣥⣶⣿⣿⣿⣿⣷⣌⣻⠷⠖⢀⣠⣿⡛⢻⣿⣿⣿⣿⣿⣿⣿⣷⣤⣙⠿⠿⣿⣿⠿⠿⣛⣤⣅⣤⣠⣤⣤⣤⣶⣶⡄⠀⠀",
             "⠀⠀⠀⠀⠀⠀⢠⡾⣒⣿⡟⣡⣦⣿⣿⣿⡇⣩⣛⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢛⣛⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⣾⢡⣿⠿⠙⣽⡶⠿⣿⣿⣧⣛⣵⡄⢀⡀⠀⠀⠀⠈⠙⠻⠿⡿⠿⠿⠿⠟⢊⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣙⠻⠿⠿⢿⡿⠟⠁⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⣼⠃⣿⣿⡷⢿⠟⣩⣾⣿⣿⣿⣿⣿⡇⠀⣟⡷⠀⠀⠀⠀⠀⠀⢺⡿⠃⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⣿⢠⣿⣿⡶⣿⣟⣿⣿⣿⣿⣿⣿⣿⠇⠀⢁⣤⣶⠞⣡⣴⣶⣶⣶⠚⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠘⡷⢸⣿⣿⣵⡿⢿⣩⣷⣿⣿⣿⣿⠟⢀⣴⣿⣿⣷⣿⣿⣿⠟⢋⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⡟⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⣷⠸⣿⣯⣠⡿⠦⠿⣿⣿⣿⣿⣿⢀⣾⣿⡿⢻⣿⠻⣫⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⡟⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⢻⡄⢿⣿⣗⢳⡶⢷⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⠇⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠘⣇⡘⣿⣿⣞⣿⣶⢟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⣽⣷⡌⢿⣿⣿⣻⡿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠰⠿⠿⠿⠿⣆⠹⣿⣿⣷⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⡶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢶⣉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣡⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠱⢦⡍⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣄⢻⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣟⣏⣴⠿⠻⢿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠶⣬⣙⡙⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣝⢿⣿⡇⡿⢿⠟⣻⡿⠷⠚⠉⠁⠀⠀⠀⠀⠉⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠒⠲⣷⣭⣭⣭⣭⣭⣭⣭⡴⢍⢠⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"}

        -- Center the logo on the screen
        local width = 50
        local logo = dashboard.section.header.val
        for i, line in ipairs(logo) do
            dashboard.section.header.val[i] = string.rep(" ", math.floor((width - #line) / 2)) .. line
        end

        dashboard.section.buttons.val = {dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
                                         dashboard.button("f", "󰮗   Find file",
            ":cd $HOME | Telescope find_files<CR>"),
                                         dashboard.button("e", "   File Explorer", ":cd $HOME | Neotree<CR>"),
                                         dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
                                         dashboard.button("c", "   Configuration", ":e ~/.config/nvim/<CR>"),
                                         dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
                                         dashboard.button("q", "󰗼   Quit", ":qa<CR>")}

        function centerText(text, width)
            local totalPadding = width - #text
            local leftPadding = math.floor(totalPadding / 2)
            local rightPadding = totalPadding - leftPadding
            return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
        end

        dashboard.section.footer.val = {centerText("", 50), " ", centerText(date, 50), centerText(time, 50),
                                        centerText(version, 50)}

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}, {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false -- add a border to hover docs and signature help
        }
    },
    dependencies = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim", -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify"}
}, {
    'brenoprata10/nvim-highlight-colors',
    config = function()
        require('nvim-highlight-colors').setup {
            render = 'background',
            tailwind = true
        }
    end
}, {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = {
        signs = false
    }
}}
