-- ========================================================================
--  ALL KEYMAPS
-- ========================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ========================================================================
--  GENERAL UX IMPROVEMENTS
-- ========================================================================

-- Better navigation
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- better window navigation
-- map("n", "<c-h>", "<c-w>h", { desc = "move to left window" })
-- map("n", "<c-j>", "<c-w>j", { desc = "move to bottom window" })
-- map("n", "<c-k>", "<c-w>k", { desc = "move to top window" })
-- map("n", "<c-l>", "<c-w>l", { desc = "move to right window" })

-- Center screen when jumping (When moving between search result each result will be centered)
-- map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Window resizing
map("n", "<Left>", "<C-w>5<", { desc = "Increase window width" })
map("n", "<Right>", "<C-w>5>", { desc = "Decrease window width" })
map("n", "<Up>", "<C-w>5+", { desc = "Decrease window height" })
map("n", "<Down>", "<C-w>5-", { desc = "Increase window height" })

-- Better indenting in visual mode
-- Indenting highlighted line stays highlighted (default highlight goes after moving)
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Diagnostics under cursor
map("n", "<leader>d", vim.diagnostic.open_float, opts)

-- Faster quit
map("n", "qq", "<cmd>q!<CR>", opts)

-- ========================================================================
--  BUFFER & WINDOW MANAGEMENT
-- ========================================================================

map("n", "<leader>bb", "<cmd>buffers<CR>", { desc = "Buffers list" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })

-- ========================================================================
--  FILE EXPLORER — NEO-TREE
-- ========================================================================

map("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal left<CR>", { desc = "File Explorer" })
map("n", "<leader>fe", "<cmd>Neotree toggle filesystem reveal float<CR>", { desc = "File Explorer" })
map("n", "<leader>b", "<cmd>Neotree buffers toggle reveal float<CR>", { desc = "Buffers Tree" })
map("n", "<leader>g", "<cmd>Neotree git_status toggle reveal float<CR>", { desc = "Git Status Tree" })

-- =============================================================================
--  FZF-LUA — FILES, GREP, SYMBOLS, DIAGNOSTICS
-- =============================================================================

map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help" })

map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document Symbols" })
map("n", "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

map("n", "<leader>fx", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>fX", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Workspace Diagnostics" })

-- =============================================================================
--  TROUBLE — DIAGNOSTICS UI
-- =============================================================================

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Workspace)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (Buffer)" })

map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List" })

map("n", "<leader>cl", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP Definitions/Refs" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle<CR>", { desc = "LSP Symbols" })

-- ========================================================================
--  FORMAT & LINT
-- ========================================================================

map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format Buffer" })
map("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Lint Buffer" })

-- =============================================================================
--  NATIVE LSP — CLEAN HIERARCHY (<leader>l)
-- =============================================================================

-- Hover
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Go to Definition
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<leader>lD", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end, { desc = "Go to Definition (Split)" })

-- Type Definition
map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Type Definition" })

-- Implementation
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Implementation" })

-- References
map("n", "<leader>lr", vim.lsp.buf.references, { desc = "Find References" })

-- Rename
map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Code Action
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Diagnostics
map("n", "<leader>ldo", vim.diagnostic.open_float, { desc = "Diagnostics (Float)" })

map("n", "<leader>ldp", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous Diagnostic" })

map("n", "<leader>ldn", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })

-- =============================================================================
--  LSP via FZF-LUA — (<leader>lF)
-- =============================================================================

map("n", "<leader>lFd", "<cmd>FzfLua lsp_finder<CR>", { desc = "LSP Finder" })
map("n", "<leader>lFr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP References" })
map("n", "<leader>lFt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "LSP Type Definitions" })
map("n", "<leader>lFi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP Implementations" })
map("n", "<leader>lFs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document Symbols" })
map("n", "<leader>lFw", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

-- =============================================================================
--  MINI.NVIM — COMMENT / SURROUND / MOVE / DIFF
-- =============================================================================

-- Comment
map({ "n", "v" }, "gc", function()
	require("mini.comment").operator()
end, { desc = "Comment" })

map("n", "gcc", function()
	require("mini.comment").operator_line()
end, { desc = "Comment Line" })

-- Surround
map("n", "<leader>sa", function()
	require("mini.surround").add()
end, { desc = "Add Surround" })

map("n", "<leader>sd", function()
	require("mini.surround").delete()
end, { desc = "Delete Surround" })

map("n", "<leader>sr", function()
	require("mini.surround").replace()
end, { desc = "Replace Surround" })

map("n", "<leader>sf", function()
	require("mini.surround").find()
end, { desc = "Find Surround" })

-- Move lines
map("n", "<A-j>", function()
	require("mini.move").move_line("down")
end, { desc = "Move Line Down" })

map("n", "<A-k>", function()
	require("mini.move").move_line("up")
end, { desc = "Move Line Up" })

-- Diff hunks
map("n", "<leader>dp", function()
	require("mini.diff").toggle_preview()
end, { desc = "Preview Hunk" })

map("n", "<leader>dr", function()
	require("mini.diff").revert_hunk()
end, { desc = "Revert Hunk" })

map("n", "<leader>da", function()
	require("mini.diff").apply_hunk()
end, { desc = "Apply Hunk" })

map("n", "]d", function()
	require("mini.diff").goto_next()
end, { desc = "Next Hunk" })

map("n", "[d", function()
	require("mini.diff").goto_prev()
end, { desc = "Previous Hunk" })

-- =============================================================================
--  WHICH-KEY HELP
-- =============================================================================

map("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "Buffer Keymaps" })

-- =============================================================================
--  MISC
-- =============================================================================

-- gx — open URLs under cursor
map({ "n", "x" }, "gx", ":!open <cfile><CR>", { desc = "Open URL", silent = true })
