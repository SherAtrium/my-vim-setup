-- ================================================================================================
--  GLOBALS
--  ABOUT: Global Neovim configuration values (leader keys, providers)
-- ================================================================================================

-- Leader keys (space is a common and ergonomic choice)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused language providers to speed up startup
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
