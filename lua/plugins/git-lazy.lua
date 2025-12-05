-- ================================================================================================
--  LAZYGIT
--  ABOUT : Fast TUI Git interface inside Neovim
--  LINKS : https://github.com/kdheepak/lazygit.nvim
-- ================================================================================================

return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },

		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Git: Lazygit" },
			{ "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Git: Lazygit (current file)" },
			{ "<leader>gl", "<cmd>LazyGitFilter<cr>", desc = "Git: Lazygit Log" },
		},
	},
}
