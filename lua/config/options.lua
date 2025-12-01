-- ================================================================================================
-- TITLE : NeoVim options
-- ABOUT : Optimized settings for 2024+ Web Development
-- ================================================================================================

local opt = vim.opt

-- BASIC UI
opt.number = true -- Absolute line numbers
opt.relativenumber = true -- Relative numbers (best for navigation)
opt.cursorline = true -- Highlight current line
opt.scrolloff = 8 -- Keep cursor away from edges
opt.sidescrolloff = 8 -- Horizontal scroll padding
opt.wrap = false -- Disable line wrap (web dev prefers no wrap)

opt.termguicolors = true -- Full 24-bit colors
opt.signcolumn = "yes" -- Always show sign column

opt.showmode = false -- Don't show -- INSERT -- (statusline handles this)
opt.pumheight = 10 -- Completion popup max height
opt.pumblend = 10 -- Transparent completion popup
opt.winblend = 0 -- No transparency for floating windows

opt.colorcolumn = "100" -- Web dev: show 100 char column
opt.fillchars = { eob = " " } -- Replaces `~` characters on left/right sides for unused/empty lines

-- INDENTATION / TABS
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Soft tabstop
opt.expandtab = true -- Convert tabs to spaces

opt.smartindent = true
opt.autoindent = true

-- SEARCH
opt.ignorecase = true -- Case-insensitive by default
opt.smartcase = true -- Case-sensitive if uppercase used
opt.incsearch = true -- Search as you type
opt.hlsearch = false -- Don't highlight matches after search

-- COMPLETION
opt.completeopt = { "menuone", "noinsert", "noselect" } -- Recommended for nvim-cmp
opt.wildmenu = true -- Command-line completion
opt.wildmode = "longest:full,full"
opt.wildignorecase = true

-- Faster completion (prevents slowdown with snippets or heavy LSP)
opt.shortmess:append("c") -- Avoid "match x of y" messages

-- FILE HANDLING
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true -- Persistent undo

opt.updatetime = 200 -- Faster CursorHold events (LSP hover, etc)
opt.timeoutlen = 400 -- Faster keymap responsiveness
opt.ttimeoutlen = 0 -- Removes delay when pressing <Esc>

opt.autoread = true -- Automatically read external file changes
opt.autowrite = false -- Don’t auto-write unless explicitly triggered

-- TREESITTER / FOLDING
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99 -- Open all folds by default

-- DIFF SETTINGS (mini.diff/gitsigns improvements)
opt.diffopt:append("vertical")
opt.diffopt:append("algorithm:patience")
opt.diffopt:append("linematch:60") -- Smart line matching for diff

-- EDITING BEHAVIOR
opt.backspace = "indent,eol,start" -- Make backspace sane
opt.mouse = "a" -- Enable mouse
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Make gf search all subfolders (useful in JS projects)
opt.path:append("**")

opt.modifiable = true
opt.encoding = "UTF-8"

-- MATCHING / BRACKETS
opt.showmatch = true
opt.matchtime = 2

-- FILETYPE-SPECIFIC PERF (big JS repos)
opt.synmaxcol = 250 -- Don't syntax highlight beyond 250 columns (perf)
opt.lazyredraw = true -- Faster macros/commands

-- UNDO DIR
local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
opt.undodir = undodir

if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- SPLITS
opt.splitbelow = true
opt.splitright = true
