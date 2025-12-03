-- ================================================================================================
--  LAZY.NVIM BOOTSTRAP & CORE SETUP
--  ABOUT: Bootstrap the lazy.nvim plugin manager and load base configuration modules
-- ================================================================================================

----------------------------------------------------------------------------------------------------
-- Disable netrw (REQUIRED by neo-tree)
-- Must run BEFORE anything happens in runtimepath
----------------------------------------------------------------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

----------------------------------------------------------------------------------------------------
-- BOOTSTRAP lazy.nvim
----------------------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim exists; if not, clone it
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local result = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		repo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ result, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

----------------------------------------------------------------------------------------------------
-- Load core config files BEFORE plugin initialization
----------------------------------------------------------------------------------------------------
require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

----------------------------------------------------------------------------------------------------
-- Folder containing plugin specs
----------------------------------------------------------------------------------------------------
local plugins_dir = "plugins"

----------------------------------------------------------------------------------------------------
-- LAZY.NVIM CONFIGURATION
----------------------------------------------------------------------------------------------------
require("lazy").setup({
	spec = {
		-- Import all plugin modules defined inside /lua/plugins/
		{ import = plugins_dir },
	},

	-- Ensure default netrw stays disabled
	rtp = {
		disabled_plugins = {
			"netrw",
			"netrwPlugin",
		},
	},

	-- Auto-install colorscheme on first run
	install = {
		colorscheme = { "solarized-osaka" },
	},

	-- Plugin update checker (background)
	checker = {
		enabled = true,
	},
})
