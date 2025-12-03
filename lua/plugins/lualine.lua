-- ================================================================================================
--  LUALINE — STATUSLINE
--  ABOUT : Fast, highly configurable statusline
--  LINKS : https://github.com/nvim-lualine/lualine.nvim
-- ================================================================================================

----------------------------------------------------------------------------------------------------
-- Helper: Determine Node.js version for display in lualine_x section
----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
-- Plugin Declaration
----------------------------------------------------------------------------------------------------
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = "|",
				-- theme = "melange", -- Example: override theme
			},

			sections = {
				lualine_x = {
					{
						node_version,
						color = { fg = "#83BA63" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
