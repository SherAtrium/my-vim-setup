-- ================================================================================================
-- TITLE : gopls (Go Language Server)
-- ABOUT : Go-specific completion, formatting, diagnostics
-- LINKS : https://github.com/golang/tools/tree/master/gopls
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("gopls", {
		capabilities = capabilities,
		filetypes = { "go" },
	})
end
