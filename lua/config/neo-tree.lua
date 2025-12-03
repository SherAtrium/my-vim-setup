local M = {}

function M.setup()
	require("neo-tree").setup({

		-- GENERAL SETTINGS --------------------------------------------------------
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,

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

		-- FILESYSTEM --------------------------------------------------------------
		filesystem = {
			bind_to_cwd = false, -- CRITICAL: Fixes macOS refresh delays
			use_libuv_file_watcher = true, -- Real-time updates
			hijack_netrw_behavior = "open_default",

			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false, -- Show gitignored files
				hide_by_name = { ".DS_Store" },
			},

			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},

			group_empty_dirs = true,
		},

		-- BUFFERS -----------------------------------------------------------------
		buffers = {
			follow_current_file = { enabled = true },
			group_empty_dirs = true,
			show_unloaded = true,
		},

		-- GIT STATUS --------------------------------------------------------------
		git_status = {
			window = {
				position = "right",
				width = 40,
			},
		},

		-- CUSTOM COMMANDS ---------------------------------------------------------
		commands = {
			-- Fix: Neo-tree filter not refreshing immediately after <CR>
			filter_on_submit_refresh = function(state)
				local fs_cmds = require("neo-tree.sources.filesystem.commands")
				local manager = require("neo-tree.sources.manager")
				fs_cmds.filter_on_submit(state) -- apply filter
				manager.refresh("filesystem") -- force-refresh view
			end,
		},

		-- WINDOW + MAPPINGS -------------------------------------------------------
		window = {
			position = "left",
			width = 40,

			mappings = {
				["<space>"] = "toggle_node",

				-- OPEN / WINDOW PICKER
				["<cr>"] = "open_with_window_picker", -- choose window
				["o"] = "open_with_window_picker", -- consistent UX

				["S"] = "split_with_window_picker", -- select window after split
				["V"] = "vsplit_with_window_picker",

				-- NORMAL OPENING
				["s"] = "open_split",
				["v"] = "open_vsplit",
				["t"] = "open_tabnew",

				-- FILTERING (patched)
				["f"] = "filter_on_submit_refresh",
				["F"] = "clear_filter",

				["P"] = "toggle_preview",
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
			},
		},
	})
end

return M
