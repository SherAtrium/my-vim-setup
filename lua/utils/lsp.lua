-- ================================================================================================
--  LSP HELPERS
--  ABOUT : on_attach callback: keymaps, automatic import organization, etc.
-- ================================================================================================

local M = {}

----------------------------------------------------------------------------------------------------
-- on_attach(event)
-- Triggered automatically when ANY LSP server attaches to a buffer.
--
-- Responsibilities:
--   - Setup buffer-local keymaps
--   - Apply language-specific features (e.g., organize imports)
--   - Access LSP client capabilities
----------------------------------------------------------------------------------------------------
M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end

	local bufnr = event.buf
	local keymap = vim.keymap.set

	local opts = {
		noremap = true, -- avoid recursive mappings
		silent = true, -- avoid echoing commands
		buffer = bufnr, -- keymap only applies to this buffer
	}

	------------------------------------------------------------------------------------------------
	-- ORGANIZE IMPORTS (if supported by server)
	-- Creates mapping: <leader>loi
	-- Performs:
	--   1. LSP codeAction("source.organizeImports")
	--   2. Formats afterwards to maintain consistent code style
	------------------------------------------------------------------------------------------------
	if client:supports_method("textDocument/codeAction", bufnr) then
		keymap("n", "<leader>loi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})

			-- Format AFTER imports have been reorganized
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50) -- small delay so import operation finishes first
		end, opts)
	end
end

return M
