-- ================================================================================================
--  NVIM-LINT — LINTER SETUP
--  ABOUT: Defines per-language linters and automatically triggers linting
-- ================================================================================================

local M = {}

function M.setup()
	local lint = require("lint")

	-- LINTERS PER FILETYPE
	lint.linters_by_ft = {
		-- JavaScript ecosystem
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		vue = { "eslint_d" },
		svelte = { "eslint_d" },
		node = { "eslint_d" },

		-- General-purpose
		markdown = { "markdownlint" },
		sh = { "shellcheck" },
		yaml = { "yamllint" },

		-- Backend languages
		lua = { "luacheck" },
	}

	-- AUTO-LINT EVENTS
	-- Triggers linting at:
	-- - BufWritePost: right after saving
	-- - InsertLeave: when finishing typing
	-- - BufEnter: when switching buffers
	local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
		group = group,
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
