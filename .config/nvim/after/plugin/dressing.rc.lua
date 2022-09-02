-- https://github.com/stevearc/dressing.nvim
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/dressing.lua
local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
	return
end
-- TODO: Deprecate user ui options table with v2
dressing.setup({
	input = {
		enabled = true,
		default_prompt = "➤ ",
		winhighlight = "Normal:Normal,NormalNC:Normal",
	},
	select = {
		enabled = true,
		-- Priority list of preferred vim.select implementations
		backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
		builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" },
	},
})

--[[ select = {
		get_config = function(opts)
			if opts.kind == "codeaction" then
				return {
					backend = "nui",
					nui = {
						relative = "cursor",
						max_width = 40,
					},
				}
			end
		end,
	}, ]]
