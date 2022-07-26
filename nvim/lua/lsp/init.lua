require('lsp/format')

local on_attach = function(client, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr})
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Ctrl+t to go back to defintion
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr})
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer = bufnr})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = bufnr})
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

require('lspconfig')['terraformls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl, linehl = hl})
end
