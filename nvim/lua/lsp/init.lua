local on_attach = function(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer=bufnr })
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Ctrl+t to go back to defintion
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=bufnr})
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=bufnr})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=bufnr})
end
require('lspconfig')['terraformls'].setup{
    on_attach = on_attach,
}

require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
}
