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

	-- highlights = {
	-- 	fill = { bg = "#1a1a1a" },
	-- 	background = { bg = "#1a1a1a" },
	-- 	buffer_selected = { bold = false, italic = false },
	-- },
	highlights = {
		-- ACTIVE buffer
		buffer_selected = {
			-- fg = "#D9E0EE", -- bright text
			bg = "#00151c", -- subtle cyan/blue shade (match screenshot)
			bold = false,
			italic = false,
		},

		-- INACTIVE buffer
		buffer = {
			-- fg = "#00151c", -- muted text
			bg = "#00151c", -- darker background strip
			italic = false,
		},

		-- FILL AREA (empty region)
		fill = {
			bg = "#00151c",
		},

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
