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
end

return M
