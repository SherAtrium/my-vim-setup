local M = {}

function M.setup()
	local conform = require("conform")

	conform.setup({
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			-- Web / JS ecosystem
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			svelte = { "prettierd" },

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

	vim.keymap.set("n", "<leader>cf", function()
		conform.format({
			async = true,
			lsp_fallback = true,
		})
	end, { desc = "Format buffer" })
end

return M
