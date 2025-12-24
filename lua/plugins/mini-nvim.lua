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
				comment_line = "<leader>/",
				comment_visual = "<leade>/",
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
}
