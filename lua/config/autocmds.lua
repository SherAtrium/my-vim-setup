-- ================================================================================================
--  AUTO COMMANDS
--  ABOUT: Automatically trigger small actions at important editor events
-- ================================================================================================

local on_attach = require("utils.lsp").on_attach

-- RESTORE CURSOR POSITION
-- When reopening a file, jump back to the last known cursor position.
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lines_total = vim.api.nvim_buf_line_count(0)

		-- mark[1] = line, mark[2] = column
		if mark[1] > 0 and mark[1] <= lines_total then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- HIGHLIGHT YANKED TEXT
-- Provide short visual feedback (IncSearch highlight) whenever text is yanked.
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200, -- milliseconds
		})
	end,
})

-- LSP ATTACH
-- When an LSP connects to a buffer, run your custom on_attach() logic:
-- keymaps, formatting, code actions, etc.
local lsp_on_attach_group = vim.api.nvim_create_augroup("LspMappings", {})

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_on_attach_group,
	callback = on_attach,
})
