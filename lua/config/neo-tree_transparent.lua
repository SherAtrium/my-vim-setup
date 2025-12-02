local M = {}

function M.setup()
	-- Transparent Neo-tree background
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

	-- Make the separator subtle
	vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#3a3a3a", bg = "none" })
end

return M
