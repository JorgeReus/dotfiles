-- True color
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.o.termguicolors = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = false
vim.o.clipboard = "unnamedplus"
vim.g['mapleader'] = 'ñ'

-- Global mappings
vim.api.nvim_set_keymap("n", "<C-s>", ":w<Cr>", { })
vim.api.nvim_set_keymap("n", "<C-q>", ":q!<Cr>", { })
vim.api.nvim_set_keymap("", "-", ':call nerdcommenter#Comment(0, "toggle")<CR>', { noremap = true })
vim.api.nvim_set_keymap("", "-", ':call nerdcommenter#Comment(0, "toggle")<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":tabprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":tabnext<CR>", { noremap = true })
