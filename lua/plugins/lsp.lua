return {
    "neovim/nvim-lspconfig",
    events = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({
            i = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        local servers = { "bashls", "clangd", "cmake", "lua_ls", "eslint" }
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
    end,
}
