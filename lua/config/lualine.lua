-- ================================================================================================
--  LUALINE
--  ABOUT : Fast, highly configurable statusline
-- ================================================================================================

local M = {}

-- Helper function: Determine Node.js version for display in lualine_x section
local function node_version()
	local path = vim.fn.expand("%:p")

	-- Search upward for .nvmrc or .node-version
	local file = vim.fs.find({ ".nvmrc", ".node-version" }, {
		upward = true,
		path = path,
		stop = vim.loop.os_homedir(),
	})[1]

	-- If version file exists
	if file then
		local f = io.open(file, "r")
		if f then
			local version = f:read("*l")
			f:close()
			if version and version ~= "" then
				return " " .. version
			end
		end
	end

	-- Fallback: ask system node
	local handle = io.popen("node -v 2>/dev/null")
	if handle then
		local output = handle:read("*a")
		handle:close()
		return " " .. output:gsub("%s+", "")
	end

	-- If no version found at all
	return " N/A"
end

function M.setup()
	local lualine = require("lualine")

	local colors = {
		-- Core Solarized (Dark)
		base03 = "#002b36", -- main background
		-- base02 = "#073642", -- panels / sidebars
		base01 = "#586e75", -- inactive text
		-- base00 = "#657b83",
		base0 = "#839496", -- primary text
		base1 = "#93a1a1", -- separators / subtle accents
		base2 = "#eee8d5", -- light foreground
		-- base3 = "#fdf6e3",

		-- Accents
		black = "#15161E",
		yellow = "#b58900",
		orange = "#cb4b16",
		red = "#dc322f",
		magenta = "#d33682",
		violet = "#6c71c4",
		blue = "#268bd2",
		cyan = "#2aa198",
		green = "#859900",
	}

	local solarized_custom_theme = {
		normal = {
			a = { fg = colors.base2, bg = colors.yellow, gui = "bold" }, -- MODE
			b = { fg = colors.base03, bg = colors.base2, gui = "bold" }, -- BRANCH
			c = { fg = colors.base0, bg = colors.base03 }, -- DIAGNOSTICS / FILE TYPE ICON / FILE INFO

			x = { fg = colors.green, bg = colors.base03 }, -- NODE VERSION / DIFF
			y = { fg = colors.black, bg = colors.base1, gui = "bold" },
			z = { fg = colors.base2, bg = colors.yellow, gui = "bold" },
		},

		insert = {
			a = { fg = colors.base2, bg = colors.green, gui = "bold" },
		},
		visual = {
			a = { fg = colors.base2, bg = colors.violet, gui = "bold" },
		},
		replace = {
			a = { fg = colors.base2, bg = colors.red, gui = "bold" },
		},
		command = {
			a = { fg = colors.base2, bg = colors.orange, gui = "bold" },
		},

		inactive = {
			a = { fg = colors.base01, bg = colors.base03 },
			b = { fg = colors.base01, bg = colors.base03 },
			c = { fg = colors.base01, bg = colors.base03 },
			x = { fg = colors.base01, bg = colors.base03 },
			y = { fg = colors.base01, bg = colors.base03 },
			z = { fg = colors.base01, bg = colors.base03 },
		},
	}

	lualine.setup({
		options = {
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			padding = 1,
			theme = solarized_custom_theme,
			globalstatus = true, -- keep single statusline (not per pane/window)
		},

		sections = {
			lualine_a = {
				{
					"mode",
				},
			},
			lualine_b = {
				{
					"branch",
				},
			},
			lualine_c = {
				{
					"diagnostics",
				},
				{
					"filetype",
					icon_only = true,
					padding = { left = 1, right = 0 },
				},
				{
					"filename",
					path = 1,
					padding = 0,
				},
			},
			lualine_x = {
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			},
			lualine_y = {
				{
					node_version,
					color = { fg = colors.black, bg = colors.base02, gui = "bold" },
				},
			},
			lualine_z = {
				{
					"location",
					separator = "",
					padding = { left = 1, right = 0 },
				},
				{
					"progress",
				},
				-- function()
				-- 	return " " .. os.date("%R")
				-- end,
				-- {
				-- 	-- Showing correct system logo
				-- 	function()
				-- 		local is_mac = vim.loop.os_uname().sysname == "Darwin"
				-- 		return (is_mac and "" or "")
				-- 	end,
				-- },
				-- {
				-- "encoding",
				-- },
			},
		},
	})
end

return M
