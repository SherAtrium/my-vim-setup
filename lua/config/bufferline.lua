local M = {}

local bg = "#00151c"

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
				text = "Root",
				highlight = "Directory",
				separator = true,
			},
		},
	},

	highlights = {
		-- GLOBAL BACKGROUND AREAS
		fill = { bg = bg },
		background = { bg = bg },

		-- TABS
		tab = { bg = bg },
		tab_selected = { bg = bg },
		tab_close = { bg = bg },

		-- CLOSE BUTTON
		close_button = { bg = bg },
		close_button_visible = { bg = bg },
		close_button_selected = { bg = bg },

		-- BUFFERS
		buffer = { bg = bg },
		buffer_visible = { bg = bg },
		buffer_selected = { bg = bg, bold = false },

		-- MODIFIED MARKERS
		modified = { bg = bg },
		modified_visible = { bg = bg },
		modified_selected = { bg = bg },

		-- DUPLICATES
		duplicate = { bg = bg },
		duplicate_visible = { bg = bg },
		duplicate_selected = { bg = bg },

		-- INDICATOR (underline bar)
		indicator_selected = { bg = bg },
		indicator_visible = { bg = bg },

		-- DIAGNOSTICS
		diagnostic = { bg = bg },
		diagnostic_visible = { bg = bg },
		diagnostic_selected = { bg = bg },

		hint = { bg = bg },
		hint_visible = { bg = bg },
		hint_selected = { bg = bg },

		hint_diagnostic = { bg = bg },
		hint_diagnostic_visible = { bg = bg },
		hint_diagnostic_selected = { bg = bg },

		info = { bg = bg },
		info_visible = { bg = bg },
		info_selected = { bg = bg },

		info_diagnostic = { bg = bg },
		info_diagnostic_visible = { bg = bg },
		info_diagnostic_selected = { bg = bg },

		warning = { bg = bg },
		warning_visible = { bg = bg },
		warning_selected = { bg = bg },

		warning_diagnostic = { bg = bg },
		warning_diagnostic_visible = { bg = bg },
		warning_diagnostic_selected = { bg = bg },

		error = { bg = bg },
		error_visible = { bg = bg },
		error_selected = { bg = bg },

		error_diagnostic = { bg = bg },
		error_diagnostic_visible = { bg = bg },
		error_diagnostic_selected = { bg = bg },

		-- OFFSET BACKGROUND (Neo-tree gap)
		offset_separator = { bg = bg },

		-- SEPARATOR
		separator = { bg = bg },
		separator_visible = { bg = bg },
		separator_selected = { bg = bg },
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
