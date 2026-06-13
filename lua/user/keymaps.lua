-- Set space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General Keymaps --

-- Clear search highlights with <Leader> + nh
keymap("n", "<Leader>nh", ":nohlsearch<CR>", opts)

-- Window management (Splits)
keymap("n", "<Leader>sv", "<C-w>v", opts)     -- split window vertically
keymap("n", "<Leader>sh", "<C-w>s", opts)     -- split window horizontally
keymap("n", "<Leader>sx", ":close<CR>", opts) -- close current split window

-- Easy window navigation (No more Ctrl+W then H)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- LSP Keymaps --
-- Note: These leverage Neovim's modern built-in vim.lsp.buf core commands

-- Go to code definition (where a function/variable is declared)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Show documentation summary for whatever is under your cursor (VS Code hover tooltips)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

-- Rename all occurrences of the symbol under your cursor across the project
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })

-- See all code actions/quick-fixes available for an error under cursor
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Show signature/argument assistance while typing inside a function call
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Paste text and force it to instantly conform to your file's 4-space rules
vim.keymap.set("n", "p", "p`[v`]=", { noremap = true, silent = true, desc = "Paste and auto-indent" })
vim.keymap.set("n", "P", "P`[v`]=", { noremap = true, silent = true, desc = "Paste and auto-indent" })

-- Stay in visual mode after indenting
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent block right and re-select" })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent block left and re-select" })
