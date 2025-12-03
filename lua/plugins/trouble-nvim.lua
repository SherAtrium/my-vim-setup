-- ================================================================================================
--  TROUBLE.NVIM
--  ABOUT : A modern diagnostics list (LSP, quickfix, references, etc.)
--  LINKS : https://github.com/folke/trouble.nvim
-- ================================================================================================

return {
	"folke/trouble.nvim",

	cmd = "Trouble", -- Lazy load on command
	lazy = true, -- Do not load on startup
	opts = {}, -- Using defaults (customize here if needed)
}
