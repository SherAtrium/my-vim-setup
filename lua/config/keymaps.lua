-- ================================================================================================
--  KEYMAPS — Global keybindings for SherAtrium's Neovim configuration
--  Prefix Architecture:
--    f = search (fzf)
--    e = explorer (neo-tree)
--    b = buffers
--    g = git
--    c = code (LSP actions / formatting)
--    d = diagnostics (native)
--    t = tabs
--    w = windows / splits / layout
--    u = UI toggles
--    x = troubleshooting (Trouble)
--    s = session/system
--    h = help
-- ================================================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leaders ---------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ================================================================================================
--  GENERAL UX IMPROVEMENTS
-- ================================================================================================

-- better window navigation
-- map("n", "<c-h>", "<c-w>h", { desc = "move to left window" })
-- map("n", "<c-j>", "<c-w>j", { desc = "move to bottom window" })
-- map("n", "<c-k>", "<c-w>k", { desc = "move to top window" })
-- map("n", "<c-l>", "<c-w>l", { desc = "move to right window" })

-- Center screen when jumping (When moving between search result each result will be centered)
-- map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Better joined lines (keep cursor centered)
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Center screen on half-scroll
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Resize windows arrows
map("n", "<Left>", "<C-w>5<", { desc = "Increase window width" })
map("n", "<Right>", "<C-w>5>", { desc = "Decrease window width" })
map("n", "<Up>", "<C-w>5+", { desc = "Decrease window height" })
map("n", "<Down>", "<C-w>5-", { desc = "Increase window height" })

-- Visual-mode indentation
map("v", "<", "<gv", { desc = "indent left and reselect" })
map("v", ">", ">gv", { desc = "indent right and reselect" })

-- Quick quit
map("n", "qq", "<cmd>q!<CR>", opts)

-- ================================================================================================
--  WINDOWS & SPLITS (<leader>w…)
-- ================================================================================================

map("n", "<leader>wh", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close Window" })
map("n", "<leader>w=", "<cmd>wincmd =<CR>", { desc = "Equalize Splits" })

-- -- ================================================================================================
-- --  BUFFER MANAGEMENT (<leader>b…)
-- -- ================================================================================================
--
-- map("n", "<leader>bb", "<cmd>buffers<CR>", { desc = "Buffers List" })
-- map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
-- map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
-- map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })

-- ================================================================================================
--  NEO-TREE — File Explorer (<leader>e…)
-- ================================================================================================

map("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal left<CR>", { desc = "File Explorer" })
map("n", "<leader>ef", "<cmd>Neotree toggle filesystem reveal float<CR>", { desc = "File Explorer (float)" })
map("n", "<leader>eb", "<cmd>Neotree buffers toggle reveal float<CR>", { desc = "Buffers Tree (float)" })
map("n", "<leader>eg", "<cmd>Neotree git_status toggle reveal float<CR>", { desc = "Git Status Tree (float)" })

-- ================================================================================================
--  FZF-LUA — Search & Navigation (<leader>f…)
-- ================================================================================================

map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help Tags" })

map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document Symbols" })
map("n", "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

map("n", "<leader>fx", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>fX", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Workspace Diagnostics" })

-- ================================================================================================
--  TROUBLE — Diagnostics & LSP UI (<leader>x…)
-- ================================================================================================

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Workspace)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (Buffer)" })

map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List" })

map("n", "<leader>xl", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP Definitions/Refs" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<CR>", { desc = "LSP Symbols" })

-- ================================================================================================
--  FORMAT & LINT (<leader>c…)
-- ================================================================================================

map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format Buffer" })

map("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Lint Buffer" })

-- ================================================================================================
--  NATIVE LSP (<leader>l…)
-- ================================================================================================

map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Go-to navigation
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<leader>lD", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end, { desc = "Go to Definition (Split)" })

map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "<leader>lr", vim.lsp.buf.references, { desc = "Find References" })

-- Actions
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Diagnostics (native)
map("n", "<leader>do", vim.diagnostic.open_float, { desc = "Diagnostics (Float)" })
map("n", "<leader>dp", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous Diagnostic" })
map("n", "<leader>dn", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })

-- ================================================================================================
--  FZF-LSP Integration (<leader>lF…)
-- ================================================================================================

map("n", "<leader>lFd", "<cmd>FzfLua lsp_finder<CR>", { desc = "LSP Finder" })
map("n", "<leader>lFr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP References" })
map("n", "<leader>lFt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "Type Definitions" })
map("n", "<leader>lFi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Implementations" })
map("n", "<leader>lFs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document Symbols" })
map("n", "<leader>lFw", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

-- ================================================================================================
--  WHICH-KEY HELP
-- ================================================================================================

map("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "Show Keybinds" })

-- ================================================================================================
--  MISC
-- ================================================================================================

map({ "n", "x" }, "gx", ":!open <cfile><CR>", { desc = "Open URL", silent = true })
