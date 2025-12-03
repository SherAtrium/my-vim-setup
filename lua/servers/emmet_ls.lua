-- ================================================================================================
-- TITLE : emmet_ls (Emmet Language Server)
-- ABOUT : Provides Emmet abbreviation expansions for modern web stacks
-- LINKS : https://github.com/aca/emmet-ls
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("emmet_ls", {
		capabilities = capabilities,

		filetypes = {
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"css",
			"sass",
			"scss",
			"svelte",
			"vue",
		},
	})
end
