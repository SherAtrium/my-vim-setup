-- ================================================================================================
--  WINDOW-PICKER
--  ABOUT : Popup that lets you choose which window to open a file in
--  LINKS : https://github.com/s1n7ax/nvim-window-picker
-- ================================================================================================

return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	event = "VeryLazy",
	version = "2.*",

	config = function()
		require("window-picker").setup({
			hint = "floating-big-letter", -- giant letter in the middle of each window
			show_prompt = true,

			-- Filter out unwanted windows from the picker
			filter_rules = {
				bo = {
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					buftype = { "terminal", "quickfix" },
				},
			},
		})
	end,
}
