-- ================================================================================================
-- TITLE : bashls (Bash Language Server)
-- ABOUT : Provides IntelliSense, diagnostics, and formatting for shell scripts
-- LINKS : https://github.com/bash-lsp/bash-language-server
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("bashls", {
		capabilities = capabilities,
		filetypes = { "sh", "bash", "zsh" },
	})
end
