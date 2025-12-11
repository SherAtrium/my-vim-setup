-- ================================================================================================
--  MASON TOOL INSTALLER
--  Automatically installs LSPs, formatters, linters used in your config
-- ================================================================================================

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	event = "VeryLazy",

	opts = {
		ensure_installed = {

			-- ---------------------------
			-- LSP Servers
			-- ---------------------------
			"bash-language-server",
			"clangd",
			"dockerfile-language-server",
			"emmet-ls",
			"eslint_d", -- used for linting/formatting JS/TS
			"json-lsp",
			"lua-language-server",
			"tailwindcss-language-server",
			"typescript-language-server",
			"yaml-language-server",

			-- ---------------------------
			-- Formatters
			-- ---------------------------
			"clang-format",
			"prettierd", -- use prettierd, not prettier
			"shfmt",
			"stylua",

			-- ---------------------------
			-- Linters
			-- ---------------------------
			"cpplint",
			"fixjson",
			"hadolint",
			"shellcheck",
			"markdownlint", -- need for markdown files

			-- ---------------------------
			-- Debug Adapters (DAP)
			-- ---------------------------
			"codelldb",
		},

		-- Automatically install everything on startup
		run_on_start = true,
		auto_update = false,
	},
}
