local M = {}

M.opts = {
	options = {
		mode = "buffers",
		numbers = "none",

		separator_style = "thin",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = false,

		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,

		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
	},

	highlights = {
		-- fill = { bg = "#00151c" },
		-- background = { bg = "#00151c" },
		buffer_selected = {
			-- 	fg = "#D9E0EE",
			-- 	bg = "#00151c",
			bold = false,
			-- 	italic = false,
		},

		-- INACTIVE buffer
		-- buffer = {
		-- 	fg = "#00151c",
		-- 	bg = "#00151c",
		-- 	italic = false,
		-- },

		-- FILL AREA (empty region)

		-- SEPARATOR between buffers
		-- separator = {
		-- 	fg = "#111318",
		-- 	bg = "#161A23",
		-- },
		-- separator_selected = {
		-- 	fg = "#1E2A3A",
		-- 	bg = "#1E2A3A",
		-- },
		-- separator_visible = {
		-- 	fg = "#161A23",
		-- 	bg = "#161A23",
		-- },
	},
}

M.setup = function()
	local ok, bufferline = pcall(require, "bufferline")
	if not ok then
		return
	end

	bufferline.setup(M.opts)

	-- Buffer list
	vim.keymap.set("n", "<leader>bb", "<cmd>buffers<CR>", { desc = "Buffers List" })

	-- Navigation
	vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
	vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

	-- Pinning
	vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin/Unpin Buffer" })

	-- Moving buffers
	vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move Buffer Left" })
	vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move Buffer Right" })

	-- Close
	-- vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
	vim.keymap.set("n", "<leader>bc", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close Other Buffers" })
end

return M
