-- ================================================================================================
--  GIT-CONFLICT
--  ABOUT : Highlight, manage and resolve Git merge conflicts directly inside Neovim
--  LINKS : https://github.com/akinsho/git-conflict.nvim
-- ================================================================================================

return {
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
		config = function()
			require("git-conflict").setup({
				default_mappings = true,
				disable_diagnostics = true,
			})

			--  Conflict Resolution (<leader>gc…)
			vim.keymap.set("n", "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", { desc = "Git: Choose Ours" })
			vim.keymap.set("n", "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Git: Choose Theirs" })
			vim.keymap.set("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Git: Choose Both" })
			vim.keymap.set("n", "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", { desc = "Git: Next Conflict" })
			vim.keymap.set("n", "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", { desc = "Git: Prev Conflict" })
		end,
	},
}
