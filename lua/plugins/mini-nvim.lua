-- ================================================================================================
-- TITLE : mini.nvim
-- LINKS :
--   > github : https://github.com/nvim-mini/mini.nvim
-- ABOUT : Library of 40+ independent Lua modules.
-- ================================================================================================

return {
	{ "nvim-mini/mini.ai", version = "*", opts = {} },
	{ "nvim-mini/mini.comment", version = "*", opts = {} },
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
			},
		},
	},
}
