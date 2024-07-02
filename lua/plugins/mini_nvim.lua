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
                { { 'n', 'v' }, '<leader>e', '<Cmd>lua MiniFiles.open()<CR>', opt },
            })
        })
        require("mini.cursorword").setup({})
        require("mini.comment").setup({})
        require("mini.tabline").setup({})
        -- require("mini.map").setup({
        --     G.map({
        --         { { 'n', 'v' }, '<leader>m', '<Cmd>lua MiniMap.toggle()<CR>', opt },
        --     })
        -- })
        require("mini.pick").setup({
            G.map({
                { { 'n', 'v' }, '<leader>pf', '<Cmd>Pick files<CR>',     opt },
                { { 'n', 'v' }, '<leader>pb', '<Cmd>Pick buffers<CR>',   opt },
                { { 'n', 'v' }, '<leader>pg', '<Cmd>Pick grep_live<CR>', opt },
                { { 'n', 'v' }, '<leader>pG', '<Cmd>Pick grep<CR>',      opt },
                { { 'n', 'v' }, '<leader>pc', '<Cmd>Pick cli<CR>',       opt },
                { { 'n', 'v' }, '<leader>ph', '<Cmd>Pick help<CR>',      opt },
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
