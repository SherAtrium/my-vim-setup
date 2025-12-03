-- ================================================================================================
-- TITLE : ts_ls (TypeScript Language Server)
-- ABOUT : Full TS/JS IntelliSense powered by typescript-language-server
-- LINKS : https://github.com/typescript-language-server/typescript-language-server
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("ts_ls", {
		capabilities = capabilities,

		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},

		settings = {
			typescript = {
				indentStyle = "space",
				indentSize = 2,
			},
		},
	})
end
