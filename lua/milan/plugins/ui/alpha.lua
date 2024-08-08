return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {'RchrdAriza/nvim-web-devicons'},
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        local time = os.date '%H:%M'
        local date = os.date '%a %d %b'
        local v = vim.version()
        local version = ' v' .. v.major .. '.' .. v.minor .. '.' .. v.patch

        -- Set header
        dashboard.section.header.val =
            {'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢠⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢠⣿⣿⣿⣿⣄⢀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣦⣀⣠⠴⠚⢛⣛⣭⣥⣽⣶⣶⣶⣶⣶⣶⣶⣶⣴⣮⣭⣛⣒⡢⢤⣄⣀⡀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⡿⠟⣃⣀⣴⢶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡭⢟⣵⣿⣿⣿⣿⣿⣿⠇⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡿⠛⣹⣶⠿⣿⣿⣷⡿⠿⢿⣿⠿⠛⠛⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣻⣴⣿⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⢲⣶⣶⣶⣶⡾⣉⣤⣾⣿⣿⣿⠿⣿⣿⣋⣙⣿⡇⢀⠀⠰⣿⡷⠀⢹⣿⠛⠛⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠹⣿⠟⣋⣵⣿⢏⣾⣿⣿⢻⣥⣶⣿⣿⣿⣿⣷⣌⣻⠷⠖⢀⣠⣿⡛⢻⣿⣿⣿⣿⣿⣿⣿⣷⣤⣙⠿⠿⣿⣿⠿⠿⣛⣤⣅⣤⣠⣤⣤⣤⣶⣶⡄⠀⠀',
             '⠀⠀⠀⠀⠀⠀⢠⡾⣒⣿⡟⣡⣦⣿⣿⣿⡇⣩⣛⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢛⣛⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⣾⢡⣿⠿⠙⣽⡶⠿⣿⣿⣧⣛⣵⡄⢀⡀⠀⠀⠀⠈⠙⠻⠿⡿⠿⠿⠿⠟⢊⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣙⠻⠿⠿⢿⡿⠟⠁⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⣼⠃⣿⣿⡷⢿⠟⣩⣾⣿⣿⣿⣿⣿⡇⠀⣟⡷⠀⠀⠀⠀⠀⠀⢺⡿⠃⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⣿⢠⣿⣿⡶⣿⣟⣿⣿⣿⣿⣿⣿⣿⠇⠀⢁⣤⣶⠞⣡⣴⣶⣶⣶⠚⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠘⡷⢸⣿⣿⣵⡿⢿⣩⣷⣿⣿⣿⣿⠟⢀⣴⣿⣿⣷⣿⣿⣿⠟⢋⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⡟⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⣷⠸⣿⣯⣠⡿⠦⠿⣿⣿⣿⣿⣿⢀⣾⣿⡿⢻⣿⠻⣫⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⡟⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⢻⡄⢿⣿⣗⢳⡶⢷⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⠇⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠘⣇⡘⣿⣿⣞⣿⣶⢟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⣽⣷⡌⢿⣿⣿⣻⡿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠰⠿⠿⠿⠿⣆⠹⣿⣿⣷⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⡶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢶⣉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣡⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠱⢦⡍⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣄⢻⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣟⣏⣴⠿⠻⢿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠶⣬⣙⡙⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣝⢿⣿⡇⡿⢿⠟⣻⡿⠷⠚⠉⠁⠀⠀⠀⠀⠉⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
             '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠒⠲⣷⣭⣭⣭⣭⣭⣭⣭⡴⢍⢠⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'}

        -- Center the logo on the screen
        local width = 50
        local logo = dashboard.section.header.val
        for i, line in ipairs(logo) do
            dashboard.section.header.val[i] = string.rep(' ', math.floor((width - #line) / 2)) .. line
        end

        dashboard.section.buttons.val = {dashboard.button('n', '   New file', ':ene <BAR> startinsert <CR>'),
                                         dashboard.button('f', '󰮗   Find file',
            ':cd $HOME | Telescope find_files<CR>'),
                                         dashboard.button('e', '   File Explorer', ':cd $HOME | Neotree<CR>'),
                                         dashboard.button('r', '   Recent', ':Telescope oldfiles<CR>'),
                                         dashboard.button('c', '   Configuration', ':e ~/.config/nvim/<CR>'),
                                         dashboard.button('R', '󱘞   Ripgrep', ':Telescope live_grep<CR>'),
                                         dashboard.button('q', '󰗼   Quit', ':qa<CR>')}

        function centerText(text, width)
            local totalPadding = width - #text
            local leftPadding = math.floor(totalPadding / 2)
            local rightPadding = totalPadding - leftPadding
            return string.rep(' ', leftPadding) .. text .. string.rep(' ', rightPadding)
        end

        dashboard.section.footer.val = {centerText('', 50), ' ', centerText(date, 50), centerText(time, 50),
                                        centerText(version, 50)}

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    end
}