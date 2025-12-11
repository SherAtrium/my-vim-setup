-- ================================================================================================
--  NVIM-TREESITTER
--  ABOUT : AST-based syntax highlighting, indentation, and code-aware selections
--  LINKS : https://github.com/nvim-treesitter/nvim-treesitter
-- ================================================================================================

return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate", -- auto-update parsers
	event = { "BufReadPost", "BufNewFile" }, -- load lazily
	lazy = false, -- ensure it loads early

	config = function()
		require("nvim-treesitter.configs").setup({

			--------------------------------------------------------------------------------------------
			-- Essential parsers
			--------------------------------------------------------------------------------------------
			ensure_installed = {
				-- Web
				"html",
				"css",
				"scss",
				"styled",
				"javascript",
				"typescript",
				"tsx",
				"svelte",
				"vue",
				"graphql",
				"json",
				"yaml",

				-- Backend / Other
				"bash",
				"dockerfile",
				"lua",
				"markdown",
				"markdown_inline",
				"sql",
			},

			auto_install = true, -- auto-install missing parsers
			sync_install = false, -- async installation

			--------------------------------------------------------------------------------------------
			-- Highlighting
			--------------------------------------------------------------------------------------------
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			--------------------------------------------------------------------------------------------
			-- Indentation
			--------------------------------------------------------------------------------------------
			indent = { enable = true },

			--------------------------------------------------------------------------------------------
			-- Incremental Selection (TS-based text objects)
			--------------------------------------------------------------------------------------------
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
		})
	end,
}
