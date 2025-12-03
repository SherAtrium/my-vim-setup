-- ================================================================================================
-- TITLE : lua_ls (Lua Language Server)
-- ABOUT : Provides completion, linting, and analysis for Lua
-- LINKS : https://github.com/LuaLS/lua-language-server
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("lua_ls", {
		capabilities = capabilities,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" }, -- Recognize 'vim' global for config scripts
				},

				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
					},
				},
			},
		},
	})
end
