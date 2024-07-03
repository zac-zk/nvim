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

        local servers = { "bashls", "clangd", "cmake", "lua_ls", "pyright", "markdown_oxide", "jsonls", "lemminx" }
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
            { { "n" }, "<leader>=",  "<Cmd>lua vim.lsp.buf.format()<CR><Cmd>retab<CR>" },
            { { "n" }, "<leader>a",  "<Cmd>Lspsaga code_action<CR>" },
            { { "n" }, "<leader>r",  "<Cmd>Lspsaga rename<CR>" },
            { { "n" }, "<leader>t",  "<Cmd>Lspsaga term_toggle<CR>" },
            { { "n" }, "<leader>gd", "<Cmd>Lspsaga goto_definition<CR>" },
            { { "n" }, "<leader>pd", "<Cmd>Lspsaga peek_definition<CR>" },
            { { "n" }, "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
            { { "n" }, "<S-k>",      "<Cmd>Lspsaga hover_doc<CR>" },
        })
    end,
}
