-- ================================================================================================
-- TITLE : lualine.nvim
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- ABOUT : A blazing fast and easy to configure Neovim statusline written in Lua.
-- ================================================================================================

-- ============================
-- Node.js Version Finder
-- ============================
local function node_version()
	local path = vim.fn.expand("%:p")

	-- Look for .nvmrc or .node-version upwards
	local file = vim.fs.find({ ".nvmrc", ".node-version" }, {
		upward = true,
		path = path,
		stop = vim.loop.os_homedir(),
	})[1]

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

	-- Fallback: use system node
	local handle = io.popen("node -v 2>/dev/null")
	if handle then
		local out = handle:read("*a")
		handle:close()
		return " " .. out:gsub("%s+", "")
	end

	return " N/A"
end

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "melange",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = "|",
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
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
