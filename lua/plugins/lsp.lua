return {
    "neovim/nvim-lspconfig",
    events = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        local servers = { "bashls", "clangd", "cmake", "lua_ls", "pyright" }
        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
            })
        end

        require("lspsaga").setup({})

        local G = require("G")
        G.map({
            { { "n" }, "<leader>=", "<cmd>lua vim.lsp.buf.format()<cr><cmd>retab<cr>" },
            { { "n" }, "<leader>a", "<cmd>Lspsaga code_action<cr>" },
            { { "n" }, "<leader>r", "<cmd>Lspsaga rename<cr>" },
            { { "n" }, "<leader>t", "<cmd>Lspsaga term_toggle<cr>" },
            { { "n" }, "gd",        "<cmd>Lspsaga goto_definition<cr>" },
            { { "n" }, "pd",        "<cmd>Lspsaga peek_definition<cr>" },
            { { "n" }, "gD",        "<cmd>lua vim.lsp.buf.declaration()<cr>" },
            { { "n" }, "<s-k>",     "<cmd>Lspsaga hover_doc<cr>" },
        })
    end,
}
