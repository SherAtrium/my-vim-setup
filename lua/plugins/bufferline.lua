-- ================================================================================================
--  BUFFERLINE — Beautiful & functional buffer/tab line
--  ABOUT : Shows open buffers with icons, diagnostics, indicators, pinning, close buttons
--  LINKS : https://github.com/akinsho/bufferline.nvim
-- ================================================================================================
return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("config.bufferline").setup()
	end,
}
