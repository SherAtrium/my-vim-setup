-- ================================================================================================
--  GITHUB COPILOT — INLINE AI SUGGESTIONS
--  ABOUT : AI-powered ghost text suggestions while typing
--  NOTES : NOT integrated with nvim-cmp
-- ================================================================================================

return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false, -- disable side panel
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<leader><TAB>",
					accept_word = false,
					accept_line = false,
					next = false,
					prev = false,
					dismiss = "<C-d>",
				},
			},
		})
	end,
}
