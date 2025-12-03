-- ================================================================================================
--  NVIM-LSPCONFIG
--  ABOUT : Configures Neovim's built-in LSP client and loads language servers
--  LINKS :
--    https://github.com/neovim/nvim-lspconfig
--    https://github.com/mason-org/mason.nvim
-- ================================================================================================

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} }, -- LSP installer & package manager
		"hrsh7th/cmp-nvim-lsp", -- Recommended LSP capabilities for nvim-cmp
	},

	config = function()
		-- Your custom diagnostics signs, inline messages, etc.
		require("utils.diagnostics").setup()

		-- Your LSP servers configuration (Lua, TS, etc.)
		require("servers")
	end,
}
