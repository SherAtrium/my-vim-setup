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

	lualine.setup({
		options = {
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			padding = 1,
			theme = "solarized-osaka",
		},

		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "branch", color = { bg = "#93a1a1" }, separator = { right = "" } },
			},
			lualine_c = {
				{ "diagnostics", color = { bg = "none" }, separator = { right = "" } },
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{ "filename", path = 1, padding = 0 },
			},
			lualine_x = {
				{ node_version, color = { bg = "none", fg = "#859900" }, separator = { left = "" } },
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					separator = { left = "" },
					-- diff_color = {
					-- added = { fg = colors.green },
					-- modified = { fg = colors.orange },
					-- removed = { fg = colors.red },
					-- },
					color = { bg = "none" },
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
				-- {
				-- 	-- Showing correct system logo
				-- 	function()
				-- 		local is_mac = vim.loop.os_uname().sysname == "Darwin"
				-- 		return (is_mac and "" or "")
				-- 	end,
				-- },
				-- {
				-- "encoding",
				-- color = { bg = "none" },
				-- separator = { left = "" },
				-- },
			},
			lualine_y = {
				{ "progress", color = { bg = "#93a1a1" }, separator = " ", padding = { left = 1, right = 1 } },
				{ "location", color = { bg = "#93a1a1" }, padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				-- { "location", padding = { left = 1, right = 0 } },
				{ " ", padding = { left = 1, right = 1 }, color = { bg = "#002b36" }, separator = " " },
				function()
					return " " .. os.date("%R")
				end,
			},
		},
	})
end

return M
