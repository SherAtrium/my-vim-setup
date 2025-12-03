-- ================================================================================================
-- TITLE : dockerls (Dockerfile Language Server)
-- ABOUT : Provides syntax checking and completions for Dockerfiles
-- LINKS : https://github.com/rcjsuen/dockerfile-language-server-nodejs
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("dockerls", {
		capabilities = capabilities,
		filetypes = { "dockerfile" },
	})
end
