-- ================================================================================================
--  NEOVIM OPTIONS
--  ABOUT: Modern, performance-focused configuration ideal for Web Development (2024+)
-- ================================================================================================

local opt = vim.opt

----------------------------------------------------------------------------------------------------
-- UI SETTINGS
----------------------------------------------------------------------------------------------------
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Relative line numbers improve navigation
opt.cursorline = false -- Highlight current line
opt.scrolloff = 8 -- Keep cursor vertically centered
opt.sidescrolloff = 8 -- Horizontal padding
opt.wrap = false -- Disable line wrapping (web dev prefers no wrap)

opt.termguicolors = true -- Enable 24-bit color
opt.signcolumn = "yes" -- Always show signcolumn

opt.showmode = false -- Hide "-- INSERT --" (statusline handles it)

opt.pumheight = 10 -- Max items in completion menu
opt.pumblend = 10 -- Slight transparency for completion menu
opt.winblend = 0 -- No transparency for floating windows

opt.colorcolumn = "100" -- Visual guide at 100 chars
opt.fillchars = { eob = " " } -- Hide ~ in empty lines
opt.cmdheight = 0 -- disable command line
vim.opt.confirm = false -- Disable confirm dialog, prefer explicit saves

----------------------------------------------------------------------------------------------------
-- INDENTATION
----------------------------------------------------------------------------------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- Always use spaces instead of tabs

opt.smartindent = true
opt.autoindent = true

----------------------------------------------------------------------------------------------------
-- SEARCH
----------------------------------------------------------------------------------------------------
opt.ignorecase = true -- Case-insensitive by default
opt.smartcase = true -- Uppercase makes search case-sensitive
opt.incsearch = true -- Incremental search
opt.hlsearch = true -- Don't keep highlight after search

----------------------------------------------------------------------------------------------------
-- COMPLETION / COMMAND LINE
----------------------------------------------------------------------------------------------------
opt.completeopt = { "menuone", "noinsert", "noselect" }
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignorecase = true

opt.shortmess:append("c") -- Reduce completion noise

----------------------------------------------------------------------------------------------------
-- FILE HANDLING
----------------------------------------------------------------------------------------------------
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true -- Persistent undo history

opt.updatetime = 300 -- Affects CursorHold (LSP hover)
opt.timeoutlen = 400 -- Faster keymap sequence timeout
opt.ttimeoutlen = 0 -- No delay for ESC key

opt.autoread = true -- Reload files changed outside Nvim
opt.autowrite = false -- Only write when explicitly saving
opt.autowriteall = false -- Don't auto-save before commands

----------------------------------------------------------------------------------------------------
-- FOLDING (Tree-sitter based)
----------------------------------------------------------------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99 -- Open everything by default

----------------------------------------------------------------------------------------------------
-- DIFF (Better diffing experience)
----------------------------------------------------------------------------------------------------
opt.diffopt:append("vertical")
opt.diffopt:append("algorithm:patience")
opt.diffopt:append("linematch:60")

----------------------------------------------------------------------------------------------------
-- EDITOR BEHAVIOR
----------------------------------------------------------------------------------------------------
opt.backspace = "indent,eol,start"
opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.path:append("**") -- gf recursive search

opt.modifiable = true
opt.encoding = "UTF-8"

----------------------------------------------------------------------------------------------------
-- MATCHING / BRACKETS
----------------------------------------------------------------------------------------------------
opt.showmatch = true
opt.matchtime = 2

----------------------------------------------------------------------------------------------------
-- PERFORMANCE FOR BIG FILES (important for JS monorepos)
----------------------------------------------------------------------------------------------------
opt.synmaxcol = 250
opt.lazyredraw = true

----------------------------------------------------------------------------------------------------
-- UNDO DIRECTORY
----------------------------------------------------------------------------------------------------
local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
opt.undodir = undodir

if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

----------------------------------------------------------------------------------------------------
-- SPLIT BEHAVIOR
----------------------------------------------------------------------------------------------------
opt.splitbelow = true
opt.splitright = true
