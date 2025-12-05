-- ================================================================================================
--  COLORSCHEME — Solarized Osaka
--  ABOUT : A Solarized-inspired, modern theme with optional transparency
--  LINKS : https://github.com/craftzdog/solarized-osaka.nvim
-- ================================================================================================

return {
	"craftzdog/solarized-osaka.nvim",

	lazy = false, -- Load immediately at startup
	priority = 1000, -- Ensure the theme loads before all other plugins

	-- Basic options for the theme
	opts = function()
		return {
			transparent = true, -- Enable transparent backgrounds
		}
	end,

	config = function()
		vim.cmd("colorscheme solarized-osaka")
	end,
}
