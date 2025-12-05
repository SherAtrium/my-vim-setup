-- ================================================================================================
--  GIT SIGNS
--  ABOUT: Deep buffer integration for Git
-- ================================================================================================

local M = {}

function M.setup()
	local git_signs = require("gitsigns")

	git_signs.setup({
		sign_priority = 6,
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 100,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},

		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- =========================================================================
			--  Hunks (<leader>gs, <leader>gr, visual-mode support)
			-- =========================================================================
			map("n", "<leader>gs", gs.stage_hunk, "Git: Stage Hunk")
			map("n", "<leader>gr", gs.reset_hunk, "Git: Reset Hunk")
			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Git: Stage Visual Hunk")
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Git: Reset Visual Hunk")

			-- =========================================================================
			--  Hunk Preview + Blame
			-- =========================================================================
			map("n", "<leader>gp", gs.preview_hunk, "Git: Preview Hunk")
			map("n", "<leader>gb", gs.blame_line, "Git: Blame (Popup)")
			map("n", "<leader>gB", gs.toggle_current_line_blame, "Git: Toggle Inline Blame")

			-- =========================================================================
			--  Hunk Navigation
			-- =========================================================================
			map("n", "]h", gs.next_hunk, "Git: Next Hunk")
			map("n", "[h", gs.prev_hunk, "Git: Previous Hunk")
		end,
	})

	-- Blame Text Styles (making it better)
	vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
		-- 	bg = "NONE",
		-- italic = true,
		fg = "#657B83",
		bold = false,
	})
end

return M
