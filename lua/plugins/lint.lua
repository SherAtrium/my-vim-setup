-- ================================================================================================
--  NVIM-LINT — LINTING
--  ABOUT : Lightweight asynchronous linting for many languages
--  LINKS : https://github.com/mfussenegger/nvim-lint
-- ================================================================================================

return {
	"mfussenegger/nvim-lint",

	-- Load linting on file read or creation
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("config.lint").setup()
	end,
}
