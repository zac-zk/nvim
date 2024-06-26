return {
    "hrsh7th/nvim-cmp",
    events = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind-nvim",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<esc>"] = cmp.mapping.abort(),
                ["<Return>"] = cmp.mapping.confirm(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true, -- do not show text alongside icons
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        --Source 显示提示来源
                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                        return vim_item
                    end,
                }),
            },
        })
        cmp.setup.cmdline("/", {
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").config.setup({
            enable_autosnippets = true,
        })
    end,
}
