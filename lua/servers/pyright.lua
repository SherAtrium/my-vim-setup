-- ================================================================================================
-- TITLE : pyright (Python Language Server)
-- ABOUT : Type checking, diagnostics, auto-imports for Python
-- LINKS : https://github.com/microsoft/pyright
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("pyright", {
		capabilities = capabilities,

		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})
end
