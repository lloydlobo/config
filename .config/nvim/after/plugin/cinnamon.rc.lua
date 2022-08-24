local status_ok, cinnamon = pcall(require, 'cinnamon')
if (not status_ok) then return end

cinnamon.setup({
    default_delay = 2,        -- The default delay (in ms) between each line when scrolling.
    extra_keymaps = true,
    -- override_keybaps = true,
    max_length = 500,
    scroll_limit = -1,
})
