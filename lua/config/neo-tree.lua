-- ================================================================================================
--  NEO-TREE — FILE EXPLORER SETUP
--  ABOUT: Highly configurable UI tree for filesystem, buffers, and git status
-- ================================================================================================

local M = {}

function M.setup()
	require("neo-tree").setup({

		-- GENERAL SETTINGS
		close_if_last_window = true, -- Close neo-tree when it's the only window left
		popup_border_style = "rounded", -- Borders around floating windows
		enable_git_status = true, -- Show Git file status
		enable_diagnostics = true, -- Show LSP diagnostics inside tree

		-- AUTO-CLOSE ON FILE OPEN
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},

		-- COMPONENT CONFIGURATION
		default_component_configs = {

			indent = {
				padding = 1,
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},

			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				default = "",
				highlight = "NeoTreeFileIcon",
			},

			git_status = {
				symbols = {
					added = "✚",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},

			diagnostics = {
				symbols = {
					hint = "󰌵",
					info = "",
					warn = "",
					error = "",
				},
				highlights = {
					hint = "DiagnosticSignHint",
					info = "DiagnosticSignInfo",
					warn = "DiagnosticSignWarn",
					error = "DiagnosticSignError",
				},
			},
		},

		-- FILESYSTEM VIEW
		filesystem = {
			bind_to_cwd = false, -- Prevents delay on macOS
			use_libuv_file_watcher = true, -- Real-time FS updates
			hijack_netrw_behavior = "open_default",

			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = { ".DS_Store" },
			},

			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},

			group_empty_dirs = true,
		},

		-- BUFFERS VIEW
		buffers = {
			follow_current_file = { enabled = true },
			group_empty_dirs = true,
			show_unloaded = true,
		},

		-- GIT STATUS VIEW
		git_status = {
			window = {
				position = "right",
				width = 40,
			},
		},

		-- WINDOW + KEY MAPPINGS
		window = {
			position = "left",
			width = 40,

			mappings = {
				-- ["<space>"] = "toggle_node",

				-- Window picker
				["<cr>"] = "open_with_window_picker",
				["o"] = "open_with_window_picker",

				["S"] = "split_with_window_picker",
				["V"] = "vsplit_with_window_picker",

				-- Normal open
				["s"] = "open_split",
				["v"] = "open_vsplit",
				["t"] = "open_tabnew",

				-- -- Filtering
				-- ["f"] = "filter_on_submit",
				-- ["F"] = "clear_filter",

				-- File actions
				["P"] = {
					"toggle_preview",
					config = {
						use_float = true,
						use_snacks_image = true,
						use_image_nvim = true,
					},
				},
				["<esc>"] = "cancel",

				["a"] = { "add", config = { show_path = "relative" } },
				["A"] = "add_directory",
				["d"] = "delete",
				["r"] = "rename",
				["c"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",

				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",

				["<leader>ff"] = "none",
				["<leader>fg"] = "none",
			},
		},
	})

	-- Making neo-tree background transparent
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

	-- Subtle separator line
	vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", {
		fg = "#3a3a3a",
		bg = "none",
	})
end

return M
