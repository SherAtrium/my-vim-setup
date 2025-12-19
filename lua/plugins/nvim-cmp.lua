-- ================================================================================================
--  NVIM-CMP — AUTOCOMPLETION
--  ABOUT : Completion engine supporting LSP, snippets, buffer words, paths, etc.
--  LINKS : https://github.com/hrsh7th/nvim-cmp
-- ================================================================================================

return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"onsails/lspkind.nvim", -- VSCode-style icons
		"saadparwaiz1/cmp_luasnip", -- Snippet source
		{
			"L3MON4D3/LuaSnip", -- Snippet engine
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets", -- Pre-made snippets
		"hrsh7th/cmp-nvim-lsp", -- LSP completion source
		"hrsh7th/cmp-buffer", -- Buffer text
		"hrsh7th/cmp-path", -- File paths
		"hrsh7th/cmp-nvim-lsp-signature-help", -- Signature help
	},

	config = function()
		local lspkind = require("lspkind")
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load VSCode-style snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			------------------------------------------------------------------------------------------------
			-- SNIPPET ENGINE
			------------------------------------------------------------------------------------------------
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			------------------------------------------------------------------------------------------------
			-- UI FORMATTING
			------------------------------------------------------------------------------------------------
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						-- codeium = "",
						luasnip = "",
						buffer = "",
						path = "",
						nvim_lsp = "🅻",
					},
				}),
			},

			------------------------------------------------------------------------------------------------
			-- KEYMAPS
			------------------------------------------------------------------------------------------------
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			------------------------------------------------------------------------------------------------
			-- SOURCES
			------------------------------------------------------------------------------------------------
			sources = {
				-- { name = "codeium" }, -- AI
				{ name = "luasnip" }, -- snippets
				{ name = "nvim_lsp" }, -- LSP
				{ name = "buffer" }, -- buffer words
				{ name = "path" }, -- filesystem
				{ name = "nvim_lsp_signature_help" },
			},
		})
	end,
}
