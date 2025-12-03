-- ================================================================================================
--  NEO-TREE TRANSPARENCY OVERRIDES
--  ABOUT: Makes sidebar blend with transparent colorschemes
-- ================================================================================================

local M = {}

function M.setup()
	-- Transparent backgrounds for Neo-tree
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

	-- Subtle separator line
	vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", {
		fg = "#3a3a3a",
		bg = "none",
	})
end

return M
