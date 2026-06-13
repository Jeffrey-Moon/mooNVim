local opt = vim.opt

-- Line numbers
opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers (crucial for fast movement)

-- Tabs & Indentation
opt.tabstop = 4            -- 1 tab = 4 spaces
opt.shiftwidth = 4         -- Number of spaces for auto-indent
opt.expandtab = true       -- Convert tabs to spaces
opt.smartindent = true     -- Insert indents automatically

-- UI / Behavior
opt.mouse = "a"            -- Enable mouse support (helpful coming from VS Code!)
opt.clipboard = "unnamedplus" -- Sync Neovim clipboard with system clipboard
opt.ignorecase = true      -- Ignore case when searching...
opt.smartcase = true       -- ...unless search contains a capital letter
opt.termguicolors = true   -- Enable 24-bit RGB colors
opt.signcolumn = "yes"     -- Always show the sign column to prevent layout shifts
