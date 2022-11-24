local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local sources = {
  -- Diagnostics
  b.diagnostics.actionlint,
  b.diagnostics.buf,
  b.diagnostics.flake8,
  b.diagnostics.golangci_lint,
  b.diagnostics.hadolint,
  b.diagnostics.jsonlint,
  b.diagnostics.markdownlint,
  b.diagnostics.shellcheck,
  b.diagnostics.todo_comments,
  b.diagnostics.yamllint,
  -- Formatting
	b.formatting.stylua,
  b.formatting.terraform_fmt,
  b.formatting.prettier,
  b.formatting.golines,
  b.formatting.rustfmt,
  b.formatting.autopep8,
  b.formatting.beautysh,
  b.formatting.buf,
  b.formatting.packer,
}

null_ls.setup({
	sources = sources,
  debug = true
})
