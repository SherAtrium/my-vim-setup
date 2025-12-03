return {
	{ "nvim-mini/mini.ai", version = "*", opts = {} },
	{
		"nvim-mini/mini.comment",
		version = "*",
		opts = {
			mappings = {
				comment_line = "<C-/>",
				comment_visual = "<C-/>",
				-- Keep operator functionality
				comment = "gc",
				textobject = "gc",
			},
		},
	},
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
	{ "nvim-mini/mini.surround", version = "*", opts = {} },
	{ "nvim-mini/mini.cursorword", version = "*", opts = {} },
	{ "nvim-mini/mini.indentscope", version = "*", opts = {} },
	{ "nvim-mini/mini.pairs", version = "*", opts = {} },
	{ "nvim-mini/mini.trailspace", version = "*", opts = {} },
	{ "nvim-mini/mini.bufremove", version = "*", opts = {} },
	{ "nvim-mini/mini.notify", version = "*", opts = {} },
	{
		"nvim-mini/mini.diff",
		version = "*",
		opts = {
			-- Show ONLY signs (no colored line numbers)
			view = {
				style = "sign",
				signs = {
					add = "▒",
					change = "▒",
					delete = "▒",
				},
			},
		},
	},
}
