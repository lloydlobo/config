local wt = require("wezterm")

return {
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
    color_scheme = "Solarized Dark - Patched",
    -- color_scheme = "Solarized Dark (base16)",
    --color_scheme = "Solarized Light (base16)",
    -- color_scheme = "Solarized Dark Higher Contrast",
}
