local M = {}

function M.setup()
	local lint = require("lint")

	lint.linters_by_ft = {
		-- Web / JS ecosystem
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		vue = { "eslint_d" },
		svelte = { "eslint_d" },
		node = { "eslint_d" },

		-- Misc languages
		markdown = { "markdownlint" },
		sh = { "shellcheck" },
		yaml = { "yamllint" },

		python = { "flake8" },
		go = { "golangcilint" },
		lua = { "luacheck" },
	}

	-- Auto lint on save / insert leave / buffer enter
	local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
	vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
		group = group,
		callback = function()
			lint.try_lint()
		end,
	})

	-- Manual lint keymap
	vim.keymap.set("n", "<leader>ll", function()
		lint.try_lint()
	end, { desc = "Run linting" })
end

return M
