-- ================================================================================================
--  DIAGNOSTICS CONFIGURATION
--  ABOUT : Centralized configuration for Neovim diagnostic display (signs, virtual text, floats)
-- ================================================================================================

local M = {}

----------------------------------------------------------------------------------------------------
-- Diagnostic Signs (gutter icons)
-- Each severity level gets an icon glyph.
----------------------------------------------------------------------------------------------------
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

----------------------------------------------------------------------------------------------------
-- Setup Neovim diagnostics
-- Called once at startup from plugins/lspconfig.lua
----------------------------------------------------------------------------------------------------
M.setup = function()
	vim.diagnostic.config({

		--------------------------------------------------------------------------------------------
		-- GUTTER SIGNS (Left Side Icons)
		--------------------------------------------------------------------------------------------
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
				[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
				[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
				[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
			},
		},

		--------------------------------------------------------------------------------------------
		-- VIRTUAL TEXT
		-- The inline annotations to the right of code
		--------------------------------------------------------------------------------------------
		virtual_text = {
			severity = { min = vim.diagnostic.severity.HINT },
			spacing = 4,
			prefix = "●", -- Nice consistent symbol
		},

		underline = true, -- Underline offending code
		update_in_insert = true, -- LIVE diagnostics while typing
		severity_sort = true, -- Errors > Warnings > Info > Hints

		--------------------------------------------------------------------------------------------
		-- FLOATING DIAGNOSTIC WINDOWS
		--------------------------------------------------------------------------------------------
		float = {
			border = "rounded",
			source = "if_many", -- Show source name only if multiple sources
			focusable = false,
		},
	})
end

return M
