-- ================================================================================================
--  GITSIGNS
--  ABOUT : Git decorations in the sign column + hunk actions and inline blame
--  LINKS : https://github.com/lewis6991/gitsigns.nvim
-- ================================================================================================

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("config.git-signs").setup()
	end,
}
