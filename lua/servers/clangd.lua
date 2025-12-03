-- ================================================================================================
-- TITLE : clangd (C/C++ Language Server)
-- ABOUT : Fast and feature-rich LSP for C, C++, Objective-C
-- LINKS : https://clangd.llvm.org/
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("clangd", {
		capabilities = capabilities,

		-- Required for correct offset encoding (avoids LSP offset issues)
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},

		filetypes = { "c", "cpp" },
	})
end
