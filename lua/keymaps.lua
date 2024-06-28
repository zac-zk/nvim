local opts = {
    noremap = true,
    silent = true,
}

G.map({
    { { "n", "v" },      ";",       ":",                           {} },
    { { "n", "v" },      "<c-n>",   "<nop>",                       {} },

    { { "v", "i" },      "jk",      "<esc>",                       {} },

    -- S保存 Q退出
    { { "n", "v" },      "S",       ":call v:lua.MagicSave()<cr>", opts },
    { { "n", "v" },      "Q",       ":q!<cr>",                     opts },

    -- 快速
    { "n",               "<bs>",    '"_ciw',                       opts },

    -- VISUAL SELECT模式 s-tab tab左右缩进
    { { "n" },           "<s-tab>", "<esc>v<",                     opts },
    { { "n" },           "<tab>",   "<esc>v>",                     opts },
    { { "v" },           "<s-tab>", "<",                          opts },
    { { "v" },           "<tab>",   ">",                          opts },

    -- 选中全文
    { { "n", "i", "v" }, "<C-a>",   "<esc>ggVG",                   opts },

    -- 全局替换
    { { "n", "v", "i" }, "<c-h>",   "<esc>:%s//g<left><left>",     opts },

    -- 清空一行
    { { "n", "i" },      "<c-u>",   "<esc>cc",                     opts },

    -- alt + jk 移动行
    { { "n", "i" },      "<m-k>",   "<cmd>m .-2<cr>",              opts },
    { { "n", "i" },      "<m-j>",   "<cmd>m .+1<cr>",              opts },
    { "v",               "<m-k>",   ":m '<-2<cr>gv",               opts },
    { "v",               "<m-j>",   ":m '>+1<cr>gv",               opts },

    -- windows: sp 上下窗口 sv 左右分屏 sc关闭当前 so关闭其他 s方向切换
    { "n",               "sv",      ":vsp<cr><c-w>w",              opts },
    { "n",               "sp",      ":sp<cr><c-w>w",               opts },
    { "n",               "sc",      ":close<cr>",                  opts },
    { "n",               "so",      ":only<cr>",                   opts },
    { "n",               "sh",      "<c-w>h",                      opts },
    { "n",               "sl",      "<c-w>l",                      opts },
    { "n",               "s=",      "<c-w>=",                      opts },
    { "n",               "sk",      "<c-w>k",                      opts },
    { "n",               "sj",      "<c-w>j",                      opts },
    {
        "n",
        "<m-.>",
        "winnr() <= winnr('$') - winnr() ? '<c-w>10>' : '<c-w>10<'",
        { noremap = true, expr = true },
    },
    {
        "n",
        "<m-,>",
        "winnr() <= winnr('$') - winnr() ? '<c-w>10<' : '<c-w>10>'",
        { noremap = true, expr = true },
    },

    -- buffers: bc 关闭当前buffer，bl 右边buffer，bh 左边buffer, bb 切换buffer
    { { "n", "v" }, "bc", "<cmd>bw<cr>", opts },
    { { "n", "v" }, "bb", "<cmd>bn<cr>", opts },
    { { "n", "v" }, "bh", "<cmd>bp<cr>", opts },
    { { "n", "v" }, "bl", "<cmd>bn<cr>", opts },
})

-- 1 当目录不存在时 先创建目录, 2 当前文件是acwrite时, 用sudo保存
function MagicSave()
    if vim.fn.empty(vim.fn.glob(vim.fn.expand("%:p:h"))) then
        vim.fn.system("mkdir -p " .. vim.fn.expand("%:p:h"))
    end
    if vim.o.buftype == "acwrite" then
        vim.fn.execute("w !sudo tee > /dev/null %")
    else
        vim.fn.execute("w")
    end
    vim.lsp.buf.format()
end
