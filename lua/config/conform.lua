-- ================================================================================================
--  CONFORM — FORMATTER MANAGER
--  ABOUT: Unified formatting engine with per-language formatters
-- ================================================================================================

local M = {}

function M.setup()
	local conform = require("conform")

	conform.setup({

		------------------------------------------------------------------------------------------------
		-- AUTO FORMAT ON SAVE
		-- timeout_ms: Maximum wait time for formatter
		-- lsp_format = "fallback": Use LSP formatting if no tool is defined
		------------------------------------------------------------------------------------------------
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},

		------------------------------------------------------------------------------------------------
		-- FORMATTERS PER FILETYPE
		------------------------------------------------------------------------------------------------
		formatters_by_ft = {
			-- Web languages
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			svelte = { "prettierd" },

			-- Static content
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },

			-- Other languages
			lua = { "stylua" },
			python = { "black" },
			go = { "gofmt" },
			sh = { "shfmt" },
		},
	})
end

return M
