-- ================================================================================================
-- TITLE : tailwindcss (Tailwind Language Server)
-- ABOUT : Provides IntelliSense for Tailwind classes
-- LINKS : https://github.com/tailwindlabs/tailwindcss-intellisense
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("tailwindcss", {
		capabilities = capabilities,

		-- IMPORTANT: Detect correct project root
		root_dir = function(fname)
			return vim.fs.root(fname, {
				"tailwind.config.js",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.cjs",
				"postcss.config.mjs",
				"postcss.config.json",
			})
		end,

		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
	})
end
