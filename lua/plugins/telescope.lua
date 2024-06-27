return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")
        require("G")
        G.map({
            { { "n" }, "<leader>ff", builtin.find_files, {} },
            { { "n" }, "<leader>fg", builtin.live_grep, {} },
            { { "n" }, "<leader>fb", builtin.buffers, {} },
            { { "n" }, "<leader>fh", builtin.help_tags, {} },
        })
    end,
}
