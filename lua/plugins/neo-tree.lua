return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	config = function()
		require("config.neo-tree").setup()
	end,
}
