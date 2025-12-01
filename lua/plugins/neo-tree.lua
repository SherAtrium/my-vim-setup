return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", ":Neotree toggle filesystem reveal<CR>", desc = "Toggle Neo-tree" },
		{ "<leader>b", ":Neotree buffers toggle<CR>", desc = "Buffers" },
		{ "<leader>g", ":Neotree git_status toggle<CR>", desc = "Git Status" },
	},
	config = function()
		require("config.neo-tree").setup()
	end,
}
