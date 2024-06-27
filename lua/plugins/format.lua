return {
    "mhartington/formatter.nvim",
    events = "InsertEnter",
    config = function()
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    require("formatter.filetypes.lua").stylua,
                },
                javascript = {
                    require("formatter.filetypes.javascript").prettier,
                },
                c = {
                    require("formatter.filetypes.c").clangformat,
                },
                cpp = {
                    require("formatter.filetypes.cpp").clangformat,
                },
                python = {
                    require("formatter.filetypes.python").yapf,
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whites,
                },
            },
        })
        require("G")
        G.map({
            { { "n", "v" }, "<s-i>", "<cmd>Format | retab<cr>", {} },
        })
    end,
}
