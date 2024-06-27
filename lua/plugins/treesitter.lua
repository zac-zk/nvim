return {
    "nvim-treesitter/nvim-treesitter",
    events = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "bash",
            "bibtex",
            "css",
            "javascript",
            "json",
            "latex",
            "lua",
            "python",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            "query",
        },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
}
