-- ================================================================================================
--  CONFORM.NVIM — FORMATTING
--  ABOUT : Formatter manager (JavaScript, Lua, Python, etc.)
--  LINKS : https://github.com/stevearc/conform.nvim
-- ================================================================================================

return {
	"stevearc/conform.nvim",

	-- Only load when preparing to write a buffer
	event = { "BufWritePre" },

	config = function()
		require("config.conform").setup()
	end,
}
