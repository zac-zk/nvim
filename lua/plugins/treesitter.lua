return {
    'nvim-treesitter/nvim-treesitter',
    events = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        ensure_installed = { "c", "cpp", "bash", "bibtex", "css", "javascript", "json", "latex", "lua", "python", "vim", "xml", "yaml" },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn", -- set to `false` to disable one of the mappings
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
    }
}
