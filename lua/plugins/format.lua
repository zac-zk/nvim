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
                cpp = {
                    require("formatter.filetypes.cpp").astyle,
                },
                python = {
                    require("formatter.filetypes.python").yapf,
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whites,
                },
            },
        })
    end,
}
