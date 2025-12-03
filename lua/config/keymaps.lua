-- ================================================================================================
--  KEYMAPS — All global keybindings are defined here
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

-- Resize windows
map("n", "<Left>", "<C-w>5<", { desc = "Increase window width" })
map("n", "<Right>", "<C-w>5>", { desc = "Decrease window width" })
map("n", "<Up>", "<C-w>5+", { desc = "Decrease window height" })
map("n", "<Down>", "<C-w>5-", { desc = "Increase window height" })

-- Better indenting (keep selection)
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick quit
map("n", "qq", "<cmd>q!<CR>", opts)

-- ================================================================================================
--  BUFFER & WINDOW MANAGEMENT
-- ================================================================================================

map("n", "<leader>bb", "<cmd>buffers<CR>", { desc = "Buffers list" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Splits
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })

-- ================================================================================================
--  NEO-TREE — File Explorer
-- ================================================================================================

map("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal left<CR>", { desc = "File Explorer" })
map("n", "<leader>fe", "<cmd>Neotree toggle filesystem reveal float<CR>", { desc = "File Explorer (float)" })
map("n", "<leader>b", "<cmd>Neotree buffers toggle reveal float<CR>", { desc = "Buffers Tree" })
map("n", "<leader>g", "<cmd>Neotree git_status toggle reveal float<CR>", { desc = "Git Status Tree" })

-- ================================================================================================
--  FZF-LUA — Files, Grep, Symbols, Diagnostics
-- ================================================================================================

map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help" })

map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document Symbols" })
map("n", "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

map("n", "<leader>fx", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>fX", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Workspace Diagnostics" })

-- ================================================================================================
--  TROUBLE — Diagnostics UI
-- ================================================================================================

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Workspace)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (Buffer)" })

map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List" })

map("n", "<leader>cl", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP Definitions/Refs" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle<CR>", { desc = "LSP Symbols" })

-- ================================================================================================
--  FORMAT & LINT
-- ================================================================================================

map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format Buffer" })

map("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Lint Buffer" })

-- ================================================================================================
--  NATIVE LSP (<leader>l)
-- ================================================================================================

map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Definitions, Types, Implementations, etc.
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<leader>lD", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end, { desc = "Go to Definition (Split)" })

map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Implementation" })
map("n", "<leader>lr", vim.lsp.buf.references, { desc = "Find References" })

map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Diagnostics navigation
map("n", "<leader>ldo", vim.diagnostic.open_float, { desc = "Diagnostics (Float)" })

map("n", "<leader>ldp", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev Diagnostic" })

map("n", "<leader>ldn", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })

-- ================================================================================================
--  LSP — via FZF-LUA
-- ================================================================================================

map("n", "<leader>lFd", "<cmd>FzfLua lsp_finder<CR>", { desc = "LSP Finder" })
map("n", "<leader>lFr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP References" })
map("n", "<leader>lFt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "LSP Type Definitions" })
map("n", "<leader>lFi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP Implementations" })
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
