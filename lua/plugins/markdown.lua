return {
    "iamcco/markdown-preview.nvim",
    Cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        local G = require("G")
        G.map({
            { { 'n' }, "<leader>m", "<Cmd>MarkdownPreviewToggle<CR>", {} }
        })
    end
}
