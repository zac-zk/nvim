return {
    -- "folke/tokyonight.nvim",
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- vim.cmd([[colorscheme tokyonight-moon]])
        vim.cmd([[colorscheme nord]])
    end
}
