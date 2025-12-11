-- ================================================================================================
--  LSP SERVER INITIALIZER
--  ABOUT : Loads and enables all individual LSP server configurations
-- ================================================================================================

-- Capabilities for completions (nvim-cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

----------------------------------------------------------------------------------------------------
-- LOAD SERVER CONFIGURATIONS
----------------------------------------------------------------------------------------------------
require("servers.lua_ls")(capabilities)
require("servers.jsonls")(capabilities)
require("servers.ts_ls")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)
require("servers.dockerls")(capabilities)
require("servers.emmet_ls")(capabilities)
require("servers.yamlls")(capabilities)
require("servers.tailwindcss")(capabilities)

----------------------------------------------------------------------------------------------------
-- ENABLE ALL SERVERS
-- This ensures Neovim starts each server automatically when opening relevant filetypes.
----------------------------------------------------------------------------------------------------
vim.lsp.enable({
	"lua_ls",
	"jsonls",
	"ts_ls",
	"bashls",
	"clangd",
	"dockerls",
	"emmet_ls",
	"yamlls",
	"tailwindcss",
})
