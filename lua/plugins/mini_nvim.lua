return {
    'echasnovski/mini.nvim',
    version = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local G = require("G")
        local opt = {
            noremap = true,
            silent = true,
        }
        require("mini.indentscope").setup({})
        require("mini.surround").setup({})
        require("mini.pairs").setup({})
        require("mini.files").setup({
            G.map({
                { { 'n', 'v' }, '<leader>e', '<cmd>lua MiniFiles.open()<cr>', opt },
            })
        })
        require("mini.cursorword").setup({})
        require("mini.comment").setup({})
        require("mini.tabline").setup({})
        -- require("mini.map").setup({
        --     G.map({
        --         { { 'n', 'v' }, '<leader>m', '<cmd>lua MiniMap.toggle()<cr>', opt },
        --     })
        -- })
        require("mini.pick").setup({
            G.map({
                { { 'n', 'v' }, '<leader>pf', '<cmd>Pick files<cr>',     opt },
                { { 'n', 'v' }, '<leader>pb', '<cmd>Pick buffers<cr>',   opt },
                { { 'n', 'v' }, '<leader>pg', '<cmd>Pick grep_live<cr>', opt },
                { { 'n', 'v' }, '<leader>pG', '<cmd>Pick grep<cr>',      opt },
                { { 'n', 'v' }, '<leader>pc', '<cmd>Pick cli<cr>',       opt },
                { { 'n', 'v' }, '<leader>ph', '<cmd>Pick help<cr>',      opt },
            })
        })
        require("mini.statusline").setup({})
        require("mini.git").setup({})
        require("mini.diff").setup({})
        require("mini.animate").setup({
            scroll = {
                enable = false,
            }
        })
        require("mini.starter").setup({})
        require("mini.bracketed").setup({})
    end
}
