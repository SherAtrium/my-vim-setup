local M = {}

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

M.setup = function()
	-- Register signs
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.diagnostic.config({
		-- Show signs in the gutter
		signs = true,

		-- Show diagnostics as virtual text
		virtual_text = {
			severity = { min = vim.diagnostic.severity.HINT },
			spacing = 4,
			prefix = "●",
		},
		-- virtual_lines = true,

		underline = true,

		-- **IMPORTANT:** Update diagnostics WHILE TYPING
		update_in_insert = true,

		-- Priority for errors > warnings > hints
		severity_sort = true,

		float = {
			border = "rounded",
			source = "if_many",
			focusable = false,
		},
	})
end

return M
