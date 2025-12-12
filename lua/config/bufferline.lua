local M = {}

M.opts = {
	options = {
		mode = "buffers",
		numbers = "none",

		separator_style = "slant",
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

		right_mouse_command = "vert sbuffer %d",
		middle_mouse_command = nil,
	},

	highlights = {
		fill = { bg = "#1a1a1a" },
		background = { bg = "#1a1a1a" },
		buffer_selected = { bold = true, italic = true },
	},
}

M.setup = function()
	local ok, bufferline = pcall(require, "bufferline")
	if not ok then
		return
	end

	bufferline.setup(M.opts)

	-- Navigation
	vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
	vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

	-- Pinning
	vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin/Unpin Buffer" })

	-- Moving buffers
	vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move Buffer Left" })
	vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move Buffer Right" })

	-- Close others
	vim.keymap.set("n", "<leader>bd", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close Other Buffers" })
end

return M
