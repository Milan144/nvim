return {
    'nvim-lualine/lualine.nvim',
    opts = function()
        local colors = {
            nc = "#16141f",
            base = "#191724",
            surface = "#1f1d2e",
            overlay = "#26233a",
            muted = "#6e6a86",
            subtle = "#908caa",
            text = "#e0def4",
            love = "#eb6f92",
            gold = "#f6c177",
            rose = "#ebbcba",
            pine = "#31748f",
            foam = "#9ccfd8",
            iris = "#c4a7e7",
            leaf = "#95b1ac",
            highlight_low = "#21202e",
            highlight_med = "#403d52",
            highlight_high = "#524f67",
            none = "NONE",
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = {
                    normal = {
                        a = { fg = colors.text, bg = colors.none },
                        b = { fg = colors.subtle, bg = colors.none },
                        c = { fg = colors.muted, bg = colors.none },
                    },
                    inactive = {
                        a = { fg = colors.muted, bg = colors.none },
                        b = { fg = colors.muted, bg = colors.none },
                        c = { fg = colors.muted, bg = colors.none },
                    },
                },
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }
    end,
}
