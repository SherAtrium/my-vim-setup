local M = {}

function M.setup()
	local lint = require("lint")

	lint.linters_by_ft = {
		lua = { "luacheck" },
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		vue = { "eslint_d" },
		python = { "flake8" },
		go = { "golangcilint" },
		sh = { "shellcheck" },
		markdown = { "markdownlint" },
		yaml = { "yamllint" },
	}

	-- Run linting automatically on events
	local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	-- Optional keymap
	vim.keymap.set("n", "<leader>ll", function()
		lint.try_lint()
	end, { desc = "Run linting" })
end

return M
