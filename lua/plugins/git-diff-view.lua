-- ================================================================================================
--  DIFFVIEW
--  ABOUT : A modern diff and merge UI for Neovim with side-by-side views
--  LINKS : https://github.com/sindrets/diffview.nvim
-- ================================================================================================

return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
			})

			--  Diffview Keymaps (<leader>gd, <leader>gD, <leader>gh)
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git: Diffview Open" })
			vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Git: Diffview Close" })
			vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", {
				desc = "Git: File History (Diffview)",
			})
		end,
	},
}
