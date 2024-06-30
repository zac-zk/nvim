return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function ()
        local G = require("G")
        G.map({
            {{'n'}, "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", {}}
        })
    end
}
