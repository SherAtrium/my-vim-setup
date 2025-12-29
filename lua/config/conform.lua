-- ================================================================================================
--  CONFORM — FORMATTER MANAGER
--  ABOUT: Unified formatting engine with per-language formatters
-- ================================================================================================

local M = {}

function M.setup()
	local conform = require("conform")
	local util = require("conform.util")

	conform.setup({
		-- AUTO FORMAT ON SAVE
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = false, -- IMPORTANT
		},

		-- FORMATTER DEFINITIONS
		formatters = {
			biome = {
				command = "bunx",
				args = { "biome", "format", "--write", "$FILENAME" },
				stdin = false,
				cwd = util.root_file({
					"biome.json",
					"biome.jsonc",
					"package.json",
				}),
			},
		},

		-- FORMATTERS PER FILETYPE
		formatters_by_ft = {
			-- Web
			javascript = { "biome", "prettier" },
			typescript = { "biome", "prettier" },
			javascriptreact = { "biome", "prettier" },
			typescriptreact = { "biome", "prettier" },
			vue = { "biome", "prettier" },
			svelte = { "biome", "prettier" },

			-- Static
			html = { "biome", "prettier" },
			css = { "biome", "prettier" },
			scss = { "biome", "prettier" },
			json = { "biome", "prettier" },
			jsonc = { "biome", "prettier" },
			yaml = { "biome", "prettier" },
			markdown = { "biome", "prettier" },

			-- Other
			lua = { "stylua" },
			sh = { "shfmt" },
		},
	})
end

return M
