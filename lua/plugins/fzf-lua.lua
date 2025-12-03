-- ================================================================================================
--  FZF-LUA — Fuzzy Finder
--  ABOUT : File search, LSP results, grep, buffers, etc.
--  LINKS : https://github.com/ibhagwan/fzf-lua
-- ================================================================================================

return {
	"ibhagwan/fzf-lua",
	lazy = false, -- load immediately (you use it often)

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {}, -- Using defaults; override in config if needed
}
