-- ================================================================================================
-- TITLE : yamlls (YAML Language Server)
-- ABOUT : YAML validation + schema associations
-- LINKS : https://github.com/redhat-developer/yaml-language-server
-- ================================================================================================

--- @param capabilities table LSP client capabilities
return function(capabilities)
	vim.lsp.config("yamlls", {
		capabilities = capabilities,

		settings = {
			yaml = {
				schemas = {
					["https://json.schemastore.org/composer.json"] = "composer.json",
					["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
				},
				validate = true,
				format = { enable = true },
			},
		},

		filetypes = { "yaml" },
	})
end
