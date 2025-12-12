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

--  BUFFER SAFETY & NEO-TREE LAYOUT RECOVERY
--  ABOUT :
--    • When the last real buffer is deleted, only Neo-tree remains.
--    • Create a new window + empty buffer so file ops still work.
--    • Fully re-open Neo-tree to restore its configured width.
--    • Move cursor into Neo-tree window automatically. (NOT WORKS YET)
-- vim.api.nvim_create_autocmd("BufDelete", {
-- 	callback = function()
-- 		local neotree_exists = false
-- 		local normal_win_exists = false
--
-- 		-- Detect if Neo-tree is the only remaining window
-- 		for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 			local buf = vim.api.nvim_win_get_buf(win)
-- 			local ft = vim.bo[buf].filetype
-- 			local bt = vim.bo[buf].buftype
--
-- 			if ft == "neo-tree" then
-- 				neotree_exists = true
-- 			elseif bt == "" then
-- 				normal_win_exists = true
-- 			end
-- 		end
--
-- 		-- If a normal window exists or Neo-tree is not open → do nothing
-- 		if normal_win_exists or not neotree_exists then
-- 			return
-- 		end
--
-- 		-- Step 1: Create a new split with an empty buffer (right side)
-- 		vim.cmd("vnew")
-- 		vim.cmd("enew")
--
-- 		-- Step 2: Close + reopen Neo-tree, then focus it
-- 		vim.schedule(function()
-- 			pcall(function()
-- 				-- Close tree first
-- 				require("neo-tree.command").execute({ action = "close" })
--
-- 				-- Re-open filesystem tree at configured position (left)
-- 				require("neo-tree.command").execute({
-- 					action = "show",
-- 					source = "filesystem",
-- 					position = "left",
-- 				})
--
-- 				-- Move cursor to Neo-tree
-- 				require("neo-tree.command").execute({ action = "focus" })
-- 			end)
-- 		end)
-- 	end,
-- })
