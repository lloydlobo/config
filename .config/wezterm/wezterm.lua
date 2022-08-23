local wt = require("wezterm")

local launch_menu = {}

return {
    launch_menu = launch_menu,
    -- Spawn a fish shell in login mode
    default_prog = { '/usr/bin/fish', '-l' },

    font_size = 12,
    font = wt.font("FiraCode Nerd Font"),
    font_rules = {
        {
            intensity = "Bold",
            font = wt.font("FiraCode Nerd Font", { weight = "Bold" }),
        },
        {
            italic = true,
            font = wt.font("JetBrains Mono Nerd Font", { weight = "Light" }),
        },
        {
            italic = true,
            intensity = "Bold",
            font = wt.font("JetBrains Mono Nerd Font", { weight = "Bold" }),
        },
    },
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
    color_scheme = "Solarized Dark - Patched",
    colors = {
        tab_bar = {
            background = '#001e27',
            inactive_tab_edge = '#002831',
            active_tab_edge = '#259286',

            active_tab = {
                bg_color = '#002831',
                fg_color = '#2176c7',
                intensity = 'Bold',
                italic = true,
                underline = 'Single',
            },
            inactive_tab = {
                bg_color = '#001e27',
                fg_color = '#819090',
            },
            new_tab = {
                bg_color = '#002831',
                fg_color = '#a57706',
            },

            active_tab_hover = {
                bg_color = '#002831',
                fg_color = '#259286',
            },
            inactive_tab_hover = {
                bg_color = '#002831',
                fg_color = '#a57706',
                intensity = 'Bold',
                italic = true,
            },
            new_tab_hover = {
                fg_color = '#002831',
                bg_color = '#a57706',
                italic = true,
            },
        }
    },
    window_frame = {
        font = wt.font("FiraCode Nerd Font"),
        active_titlebar_bg = '#001e27',
        inactive_titlebar_bg = '#001e27'
    }
}

-- https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/wezterm/Solarized%20Dark%20-%20Patched.toml
-- # Solarized Dark - Patched
-- [colors]
-- foreground = "#708284"
-- background = "#001e27"
-- cursor_bg = "#708284"
-- cursor_border = "#708284"
-- cursor_fg = "#002831"
-- selection_bg = "#002831"
-- selection_fg = "#819090"
-- ansi = ["#002831","#d11c24","#738a05","#a57706","#2176c7","#c61c6f","#259286","#eae3cb"]
-- brights = ["#475b62","#bd3613","#475b62","#536870","#708284","#5956ba","#819090","#fcf4dc"]

-- color_scheme = "Solarized Dark (base16)",
--color_scheme = "Solarized Light (base16)",
-- color_scheme = "Solarized Dark Higher Contrast",
