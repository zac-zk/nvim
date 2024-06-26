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
        local on_attach = function(_, bufnr)
            local function buf_set_option(...)
                vim.api.nvim_buf_set_option(bufnr, ...)
            end

            buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

            local opts = { buffer = bufnr, noremap = true, silent = true }
            G.map({
                { "n", "gD", vim.lsp.buf.declaration, opts },
                { "n", "gd", vim.lsp.buf.defination, opts },
                { "n", "K", vim.lsp.buf.hover, opts },
                { "n", "gi", vim.lsp.buf.implementation, opts },
                { "n", "<C-k>", vim.lsp.buf.signature_help, opts },
                { "n", "<leader>D", vim.lsp.buf.type_definition, opts },
                { "n", "<leader>r", vim.lsp.buf.rename, opts },
                { "n", "gr", vim.lsp.buf.references, opts },
                { "n", "<leader>e", vim.diagnostic.open_float, opts },
                { "n", "[d", vim.diagnostic.goto_prev, opts },
                { "n", "]d", vim.diagnostic.goto_next, opts },
                { "n", "<leader>q", vim.diagnostic.setloclist, opts },
            })
        end
        local lspconfig = require("lspconfig")
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end
    end,
}
