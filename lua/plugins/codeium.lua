-- ================================================================================================
--  CODEIUM / WINDSURF
--  ABOUT : Native Windsurf AI assistant integration for Neovim
--  LINKS : https://github.com/Exafunction/windsurf.nvim
-- ================================================================================================

return {
	"Exafunction/windsurf.nvim",

	-- Required dependencies
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp", -- integrates Codeium into completion menu
	},

	config = function()
		-- Basic setup — customize inside ~/.config/nvim/lua/config/codeium.lua if needed
		require("codeium").setup({})
	end,
}
