-- ================================================================================================
-- TITLE : melange-nvim
-- ABOUT : A subtle, warm colorscheme for Neovim inspired by Sublime Text's Melange theme.
-- LINKS :
--   > github : https://github.com/savq/melange-nvim
-- ================================================================================================

-- return {
--  "savq/melange-nvim",
--  lazy = false,
--  priority = 1000,
-- opts = {},
--  config = function()
--    vim.cmd('colorscheme melange')
--  end
-- }

return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
		return {
			transparent = true,
		}
	end,
	config = function()
		vim.cmd("colorscheme solarized-osaka")
		require("config.neo-tree_transparent").setup()
	end,
}
