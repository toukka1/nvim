return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "clangd",
                },
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require"lspconfig".lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"},
                        }
                    }
                }
            }
            require("lspconfig").rust_analyzer.setup {
                capabilities = capabilities
            }
            require("lspconfig").clangd.setup{
                capabilities = capabilities,
                cmd = { "clangd" },
                filetypes = {
                    "c", "cpp", "objc", "objcpp", "cuda", "proto"
                }
            }
        end
    },

    -- Autocompletion setup
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",    -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path",      -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline",   -- Command-line source for nvim-cmp
            "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
            "L3MON4D3/LuaSnip",      -- Snippets plugin
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)  -- For `luasnip` users.
                    end,
                },
                mapping = {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item.
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },  -- LSP source
                    { name = "luasnip" },   -- Snippets source
                }, {
                    { name = "buffer" },    -- Buffer source
                })
            })

            -- Setup for specific filetype
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" },   -- Git source
                }, {
                    { name = "buffer" },    -- Buffer source
                })
            })

            -- Setup for command line
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }    -- Buffer source
                }
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }      -- Path source
                }, {
                    { name = "cmdline" }   -- Command-line source
                })
            })
        end
    }
}
