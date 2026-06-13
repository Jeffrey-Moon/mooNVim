-- Bootstrap lazy.nvim (automatically install it if missing)
local separator = vim.loop.os_uname().sysname:find("Windows") and "\\" or "/"
local lazypath = vim.fn.stdpath("data") .. separator .. "lazy" .. separator .. "lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Run the plugin setup
require("lazy").setup({
    -- Treesitter for advanced syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- Modern singular module
            local treesitter_config = require("nvim-treesitter.config")

            treesitter_config.setup({
                ensure_installed = {
                    "c", "cpp", "python", "lua", "vim", "vimdoc", "query",
                    "javascript", "typescript", "rust", "bash"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                }
            })
        end,
    },

    -- Telescope for fuzzy finding files and text
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        -- Define your keymaps here instead!
        keys = {
            { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files" },
            { "<Leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Find text globally" },
            { "<Leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Fuzzy find open buffers" },
            { "<Leader>fh", "<cmd>Telescope oldfiles<cr>",   desc = "Fuzzy find recent files" },
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    preview = {
                        treesitter = false, -- Tells telescope previewer to use vim regex instead of broken TS hook
                    },
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                        },
                    },
                },
            })

            telescope.load_extension("fzf")
        end,
    },

    -- LSP Support & Auto-completion
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Package Manager for LSP servers, linters, and formatters
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion engine & sources
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip", -- Snippet engine (required by cmp)
        },
        config = function()
            -- Setup Mason to handle external binaries
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "clangd", "rust_analyzer" },
            })

            -- Setup Autocompletion Engine
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            -- Modern Core LSP Initialization (Fixes the Deprecation Warning)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = { "lua_ls", "pyright", "clangd", "rust_analyzer" }

            for _, server_name in ipairs(servers) do
                -- Use the native Neovim global configuration API
                vim.lsp.config(server_name, {
                    capabilities = capabilities,
                })

                -- Start/enable the server configuration actively
                vim.lsp.enable(server_name)
            end
        end,
    },

    -- Auto-generate matching bracket pairs
    {
        "echasnovski/mini.pairs",
        version = false, -- Use latest development version
        config = function()
            require("mini.pairs").setup()
        end,
    },

    -- Add this to plugins.lua to enable format-on-save
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    cpp = { "clang-format" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },

    -- Neo-tree: A visual file tree explorer sidebar
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- Gorgeous UI icons
            "MunifTanjim/nui.nvim",
        },
        keys = {
            -- Toggle the sidebar tree using <Leader> + e (Space + e)
            { "<Leader>e", "<cmd>Neotree toggle left<cr>", desc = "Toggle file explorer sidebar" },
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    width = 30,
                    mappings = {
                        -- Go UP a directory level with the '-' key
                        ["-"] = "navigate_up",

                        -- Go INTO a highlighted directory with lowercase 'l'
                        ["<c-cr>"] = "set_root",
                    },
                },
                filesystem = {
                    hijack_netrw_behavior = "open_default",
                    filtered_items = {
                        visible = true,
                        show_hidden_count = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                    follow_current_file = {
                        enabled = true,
                    },
                    -- This is the crucial flag! This forces the top header bar
                    -- to actively render and shift paths as you navigate
                    bind_to_cwd = false,
                    use_libuv_file_watcher = true,
                },
                event_handlers = {
                    {
                        event = "neo_tree_buffer_enter",
                        handler = function()
                            vim.opt_local.number = true
                            vim.opt_local.relativenumber = true
                        end,
                    },
                },
            })
        end,
    },

    -- Tokyo Night Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- Load this immediately on startup
        priority = 1000, -- Make sure it loads before other plugins
        config = function()
            -- Set the style to "moon" (choices: storm, moon, night, day)
            vim.cmd([[colorscheme tokyonight-moon]])
        end,
    },

    -- Lualine: Premium statusline bar at the bottom
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight", -- Match our theme perfectly
                    section_separators = "",
                    component_separators = "",
                },
            })
        end,
    },

    -- Add to plugins.lua
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- Add to plugins.lua
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Add to plugins.lua
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]], -- Toggle with Ctrl + Backslash
                direction = "horizontal",
            })
        end,
    }
})
