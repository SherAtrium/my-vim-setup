-- ================================================================================================
--  MINI.NVIM COLLECTION
--  ABOUT : Modern, lightweight replacements for many Neovim plugins
--  LINKS : https://github.com/nvim-mini
-- ================================================================================================

return {

	----------------------------------------------------------------------------------------------------
	-- AI — Smarter textobjects
	----------------------------------------------------------------------------------------------------
	{ "nvim-mini/mini.ai", version = "*", opts = {} },

	----------------------------------------------------------------------------------------------------
	-- COMMENTS
	-- Ctrl+/ for line & visual mode commenting
	----------------------------------------------------------------------------------------------------
	{
		"nvim-mini/mini.comment",
		version = "*",
		opts = {
			mappings = {
				comment_line = "<C-/>",
				comment_visual = "<C-/>",
				comment = "gc",
				textobject = "gc",
			},
		},
	},

	----------------------------------------------------------------------------------------------------
	-- MOVE — Move lines/blocks effortlessly
	----------------------------------------------------------------------------------------------------
	{
		"nvim-mini/mini.move",
		version = "*",

		opts = {
			mappings = {
				left = "<C-h>",
				right = "<C-l>",
				down = "<C-j>",
				up = "<C-k>",
			},
		},

		keys = {
			{ "<A-j>", desc = "Move Line Down" },
			{ "<A-k>", desc = "Move Line Up" },
		},

		config = function(_, opts)
			require("mini.move").setup(opts)

			-- Move single line
			vim.keymap.set("n", "<A-j>", function()
				require("mini.move").move_line("down")
			end, { desc = "Move Line Down" })

			vim.keymap.set("n", "<A-k>", function()
				require("mini.move").move_line("up")
			end, { desc = "Move Line Up" })
		end,
	},

	----------------------------------------------------------------------------------------------------
	-- SURROUND — Add, delete, replace surroundings
	----------------------------------------------------------------------------------------------------
	{
		"nvim-mini/mini.surround",
		version = "*",
		opts = {},

		keys = {
			{ "<leader>sa", desc = "Add Surround" },
			{ "<leader>sd", desc = "Delete Surround" },
			{ "<leader>sr", desc = "Replace Surround" },
			{ "<leader>sf", desc = "Find Surround" },
		},

		config = function(_, opts)
			local surround = require("mini.surround")
			surround.setup(opts)

			vim.keymap.set("n", "<leader>sa", surround.add, { desc = "Add Surround" })
			vim.keymap.set("n", "<leader>sd", surround.delete, { desc = "Delete Surround" })
			vim.keymap.set("n", "<leader>sr", surround.replace, { desc = "Replace Surround" })
			vim.keymap.set("n", "<leader>sf", surround.find, { desc = "Find Surround" })
		end,
	},

	----------------------------------------------------------------------------------------------------
	-- MISC MINI MODULES — Minimal config required
	----------------------------------------------------------------------------------------------------
	{ "nvim-mini/mini.cursorword", version = "*", opts = {} },
	{ "nvim-mini/mini.indentscope", version = "*", opts = {} },
	{ "nvim-mini/mini.pairs", version = "*", opts = {} },
	{ "nvim-mini/mini.trailspace", version = "*", opts = {} },
	{ "nvim-mini/mini.bufremove", version = "*", opts = {} },
	{ "nvim-mini/mini.notify", version = "*", opts = {} },

	----------------------------------------------------------------------------------------------------
	-- DIFF — Git-like hunks, preview, apply, revert
	----------------------------------------------------------------------------------------------------
	{
		"nvim-mini/mini.diff",
		version = "*",

		opts = {
			view = {
				style = "sign",
				signs = {
					add = "▒",
					change = "▒",
					delete = "▒",
				},
			},
		},

		keys = {
			{ "<leader>dp", desc = "Preview Hunk" },
			{ "<leader>dr", desc = "Revert Hunk" },
			{ "<leader>da", desc = "Apply Hunk" },
			{ "]d", desc = "Next Hunk" },
			{ "[d", desc = "Prev Hunk" },
		},

		config = function(_, opts)
			local diff = require("mini.diff")
			diff.setup(opts)

			vim.keymap.set("n", "<leader>dp", diff.toggle_preview, { desc = "Preview Hunk" })
			vim.keymap.set("n", "<leader>dr", diff.revert_hunk, { desc = "Revert Hunk" })
			vim.keymap.set("n", "<leader>da", diff.apply_hunk, { desc = "Apply Hunk" })
			vim.keymap.set("n", "]d", diff.goto_next, { desc = "Next Hunk" })
			vim.keymap.set("n", "[d", diff.goto_prev, { desc = "Prev Hunk" })
		end,
	},
}
