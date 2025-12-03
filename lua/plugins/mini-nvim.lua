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
	},

	----------------------------------------------------------------------------------------------------
	-- SURROUND — Add, delete, replace surroundings
	----------------------------------------------------------------------------------------------------
	{
		"nvim-mini/mini.surround",
		version = "*",
		opts = {},

		mappings = {
			add = "sa", -- Add surrounding in Normal and Visual modes
			delete = "sd", -- Delete surrounding
			find = "sf", -- Find surrounding (to the right)
			find_left = "sF", -- Find surrounding (to the left)
			highlight = "sh", -- Highlight surrounding
			replace = "sr", -- Replace surrounding

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},
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

		mappings = {
			-- Apply hunks inside a visual/operator region
			apply = "gh",
			-- Reset hunks inside a visual/operator region
			reset = "gH",

			-- Hunk range textobject to be used inside operator
			-- Works also in Visual mode if mapping differs from apply and reset
			textobject = "gh",

			-- Go to hunk range in corresponding direction
			goto_first = "[H",
			goto_prev = "[h",
			goto_next = "]h",
			goto_last = "]H",
		},
	},
}
