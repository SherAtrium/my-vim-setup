-- ================================================================================================
--  GIT INTEGRATION — Gitsigns + Diffview + Git Conflict + (optional) Neogit
--  Prefix Architecture:
--    <leader>g  = Git main actions
--    <leader>gc = Git conflict resolution
-- ================================================================================================

return {

	---------------------------------------------------------------------------
	-- Gitsigns: signs, hunks, preview, blame
	---------------------------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup({
				sign_priority = 6,
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				current_line_blame = false,

				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					-- =========================================================================
					--  Hunks (<leader>gs, <leader>gr, visual-mode support)
					-- =========================================================================
					map("n", "<leader>gs", gs.stage_hunk, "Git: Stage Hunk")
					map("n", "<leader>gr", gs.reset_hunk, "Git: Reset Hunk")
					map("v", "<leader>gs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "Git: Stage Visual Hunk")
					map("v", "<leader>gr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "Git: Reset Visual Hunk")

					-- =========================================================================
					--  Hunk Preview + Blame
					-- =========================================================================
					map("n", "<leader>gp", gs.preview_hunk, "Git: Preview Hunk")
					map("n", "<leader>gb", gs.blame_line, "Git: Blame (Popup)")
					map("n", "<leader>gB", gs.toggle_current_line_blame, "Git: Toggle Inline Blame")

					-- =========================================================================
					--  Hunk Navigation
					-- =========================================================================
					map("n", "]h", gs.next_hunk, "Git: Next Hunk")
					map("n", "[h", gs.prev_hunk, "Git: Previous Hunk")
				end,
			})
		end,
	},

	---------------------------------------------------------------------------
	-- Diffview: rich diffs, file history, compare branches
	---------------------------------------------------------------------------
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
			})

			-- =========================================================================
			--  Diffview Keymaps (<leader>gd, <leader>gD, <leader>gh)
			-- =========================================================================
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git: Diffview Open" })
			vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Git: Diffview Close" })
			vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", {
				desc = "Git: File History (Diffview)",
			})
		end,
	},

	---------------------------------------------------------------------------
	-- Git Conflict: quick conflict resolution UI
	---------------------------------------------------------------------------
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
		config = function()
			require("git-conflict").setup({
				default_mappings = true,
				disable_diagnostics = true,
			})

			-- =========================================================================
			--  Conflict Resolution (<leader>gc…)
			-- =========================================================================
			vim.keymap.set("n", "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", { desc = "Git: Choose Ours" })
			vim.keymap.set("n", "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Git: Choose Theirs" })
			vim.keymap.set("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Git: Choose Both" })
			vim.keymap.set("n", "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", { desc = "Git: Next Conflict" })
			vim.keymap.set("n", "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", { desc = "Git: Prev Conflict" })
		end,
	},

	---------------------------------------------------------------------------
	-- Optional: Neogit — Magit-like Git UI
	---------------------------------------------------------------------------
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = function()
			require("neogit").setup({
				integrations = { diffview = true },
			})

			-- =========================================================================
			--  Launch Neogit (<leader>gn)
			-- =========================================================================
			vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Git: Neogit" })
		end,
	},
}
