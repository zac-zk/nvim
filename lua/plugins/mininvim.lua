return {
    {
        "echasnovski/mini.pairs",
        version = false,
        events = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.comment",
        version = false,
        events = "VeryLazy",
        opts = {
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both nNormal and Visual modes
                comment = "gc",
                -- Toggle comment on current line
                comment_line = "gcc",
                -- Toggle comment on visual selection
                comment_visual = "gc",
                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                textobject = "gc",
            },
        },
    },
    {
        "echasnovski/mini.cursorword",
        version = false,
        events = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        events = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.tabline",
        version = false,
        events = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.surround",
        version = false,
        events = "VeryLazy",
        opts = {
            highlight_duration = 50,
            mappings = {
                add = "ys", -- Add surrounding in Normal and Visual modes
                delete = "ds", -- Delete surrounding
                replace = "cs", -- Replace surrounding
            },
        },
    },
}
