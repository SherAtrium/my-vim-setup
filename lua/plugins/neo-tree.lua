-- ================================================================================================
--  NEO-TREE — FILE EXPLORER
--  ABOUT : Modern, UI-rich file explorer for Neovim
--  LINKS : https://github.com/nvim-neo-tree/neo-tree.nvim
-- ================================================================================================

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false, -- load early (you use <leader>e often)

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	cmd = "Neotree", -- allow lazy loading via command as well

	config = function()
		require("config.neo-tree").setup()
	end,
}
