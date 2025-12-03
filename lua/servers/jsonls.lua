-- ================================================================================================
-- TITLE : jsonls (JSON Language Server)
-- ABOUT : JSON schema validation and IntelliSense
-- LINKS : https://github.com/microsoft/vscode-json-languageservice
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("jsonls", {
		capabilities = capabilities,
		filetypes = { "json", "jsonc" },
	})
end
