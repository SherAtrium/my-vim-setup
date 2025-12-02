local M = {}

function M.setup()
	require("neo-tree").setup({

		-- GENERAL SETTINGS
		close_if_last_window = true, -- Close neo-tree if it's the last window
		popup_border_style = "rounded", -- Nice rounded borders
		enable_git_status = true, -- Show git signs/icons
		enable_diagnostics = true, -- Show LSP diagnostics in tree

		-- DEFAULT COMPONENT CONFIGS (ICONS, GIT, DIAGNOSTICS, ETC)
		default_component_configs = {

			-- INDENTATION
			indent = {
				padding = 1,
				with_expanders = true, -- Show expand arrows
				expander_collapsed = "", -- Closed folder arrow
				expander_expanded = "", -- Open folder arrow
			},

			-- ICONS (FILE, FOLDER)
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				default = "",
				highlight = "NeoTreeFileIcon",
			},

			-- GIT STATUS ICONS & COLORS
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

			-- DIAGNOSTICS ICONS
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

		-- FILESYSTEM SETTINGS (MAIN TREE)
		filesystem = {
			filtered_items = {
				visible = false, -- Hide filtered items by default
				hide_dotfiles = false, -- Keep dotfiles visible (like .env)
				hide_gitignored = false, -- Hide files ignored by .gitignore
				hide_by_name = { ".DS_Store" }, --Hide specific folders
			},

			-- UPDATED API → must be a table
			follow_current_file = {
				enabled = true, -- Auto focus file in tree when opened
				leave_dirs_open = false,
			},

			group_empty_dirs = true, -- Collapse nested empty directories
			use_libuv_file_watcher = true, -- Real-time update without refreshing

			hijack_netrw_behavior = "open_default", -- Replace netrw completely
		},

		-- BUFFERS VIEW (OPEN FILES)
		buffers = {
			-- UPDATED API → must be a table
			follow_current_file = {
				enabled = true, -- Auto-highlight active buffer
			},
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

		-- WINDOW & UI SETTINGS
		window = {
			position = "left",
			width = 40,

			-- Keymaps inside neo-tree window
			mappings = {
				["<space>"] = "toggle_node",
				-- ["<cr>"] = "open",
				["o"] = "open",
				["s"] = "open_split",
				["v"] = "open_vsplit",
				["t"] = "open_tabnew",

				["P"] = "toggle_preview", -- preview in floating window
				["<esc>"] = "cancel", -- close preview window

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
