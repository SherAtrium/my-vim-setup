-- ================================================================================================
--  LUALINE — STATUSLINE
--  ABOUT : Fast, highly configurable statusline
--  LINKS : https://github.com/nvim-lualine/lualine.nvim
-- ================================================================================================

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("config.lualine").setup()
	end,
}
