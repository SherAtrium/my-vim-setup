-- ================================================================================================
--  Gitsigns: Blame Text Styles
-- ================================================================================================

local M = {}

function M.setup()
	vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
		-- 	bg = "NONE",
		-- italic = true,
		fg = "#657B83",
		bold = false,
	})
end

return M
