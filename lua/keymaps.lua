local opts = {
    noremap = true,
    silent = true,
}

G.map({
    { { "n", "v" },      ";",          ":",                           {} },
    { { "n", "v" },      "<C-n>",      "<Nop>",                       {} },

    { { "v", "i" },      "jk",         "<Esc>",                       {} },
    { { 'i' },           "<C-o>",      "<Esc>o",                      {} },

    -- S保存 Q退出
    { { "n", "v" },      "<S-s>",      ":call v:lua.MagicSave()<CR>", opts },
    { { "n", "v" },      "<S-q>",      ":q!<CR>",                     opts },

    -- 快速
    { "n",               "<BS>",       '"_ciw',                       opts },

    -- VISUAL SELECT模式 S-Tab Tab左右缩进
    { { "n" },           "<S-Tab>",    "<Esc>v<",                     opts },
    { { "n" },           "<Tab>",      "<Esc>v>",                     opts },
    { { "v" },           "<S-Tab>",    "<",                           opts },
    { { "v" },           "<Tab>",      ">",                           opts },

    -- 选中全文
    { { "n", "i", "v" }, "<C-a>",      "<Esc>ggVG",                   opts },

    -- 全局替换
    { { "n", "v", "i" }, "<C-h>",      "<Esc>:%s//g<left><left>",     opts },

    -- 清空一行
    { { "n", "i" },      "<C-u>",      "<Esc>cc",                     opts },

    -- move quickly
    { { 'n', 'v' },      "<C-j>",      "8j",                          opts },
    { { 'n', 'v' },      "<C-k>",      "8k",                          opts },

    -- alt + jk 移动行
    { { "n", "i" },      "<M-k>",      "<Cmd>m .-2<CR>",              opts },
    { { "n", "i" },      "<M-j>",      "<Cmd>m .+1<CR>",              opts },
    { "v",               "<M-k>",      ":m '<-2<CR>gv",               opts },
    { "v",               "<M-j>",      ":m '>+1<CR>gv",               opts },

    -- windows: sp 上下窗口 sv 左右分屏 sc关闭当前 so关闭其他 s方向切换
    { "n",               "<leader>sv", ":vsp<CR><C-w>w",              opts },
    { "n",               "<leader>sp", ":sp<CR><C-w>w",               opts },
    { "n",               "<leader>sc", ":close<CR>",                  opts },
    { "n",               "<leader>so", ":only<CR>",                   opts },
    -- provided by mini.br<leader>acketed
    -- { "n",               "sh",      "<C-w>h",                      opts },
    -- { "n",               "sl",      "<C-w>l",                      opts },
    -- { "n",               "sk",      "<C-w>k",                      opts },
    -- { "n",               "sj",      "<C-w>j",                      opts },
    -- reset window size
    { "n",               "<leader>s=", "<C-w>=",                      opts },
    {
        "n",
        "<M-.>",
        "winnr() <= winnr('$') - winnr() ? '<C-w>10>' : '<C-w>10<'",
        { noremap = true, expr = true },
    },
    {
        "n",
        "<M-,>",
        "winnr() <= winnr('$') - winnr() ? '<C-w>10<' : '<C-w>10>'",
        { noremap = true, expr = true },
    },

    -- buffers: bc 关闭当前buffer，bl 右边buffer，bh 左边buffer, bb 切换buffer
    { { "n", "v" }, "<leader>bc", "<Cmd>bw<CR>", opts },
    { { "n", "v" }, "<leader>bb", "<Cmd>bn<CR>", opts },
    -- provided by mini.bracketed
    -- { { "n", "v" }, "bh", "<Cmd>bp<CR>", opts },
    -- { { "n", "v" }, "bl", "<Cmd>bn<CR>", opts },
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
    -- vim.lsp.buf.format()
end
