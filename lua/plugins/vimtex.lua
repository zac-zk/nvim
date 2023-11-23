return {
    "lervag/vimtex",
    config = function ()
        vim.g.vimtex_view_method = "zathura"
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_progname = 'nvr'

    end
}
