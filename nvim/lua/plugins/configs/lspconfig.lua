local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

require("base46").load_highlight "lsp"
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- lspconfig.sumneko_lua.setup {
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--           [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
--         },
--         maxPreload = 100000,
--         preloadFileSize = 10000,
--       },
--     },
--   },
-- }

lspconfig.terraformls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

lspconfig.gopls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

lspconfig.tsserver.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

lspconfig.rust_analyzer.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	settings = {
		["rust-analyzer"] = {
			imports = { granularity = { group = "module" }, prefix = "self" },
			cargo = { buildScripts = { enable = true } },
			procMacro = { enable = true },
		},
	},
}


-- Open diagnostics on hover
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- Hide inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

return M
