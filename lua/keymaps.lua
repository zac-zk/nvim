local opts = {
    noremap = true,
    silent = true
}

G.map({
    { 'n', 's',     '<nop>', {} },
    { 'n', ';',     ':',       {} },
    { 'v', ';',     ':',       {} },

    { 'i', 'jk', '<esc>', {}},

    -- S保存 Q退出
    { { 'n' , 'v' }, 'S',     ':call v:lua.MagicSave()<cr>', opts },
    { 'n', 'Q',     ':q!<cr>', opts },

    -- 快速删除
    { 'n', '<bs>',        '"_ciw',   opts },

    -- VISUAL SELECT模式 s-tab tab左右缩进
    { { 'v', 'n' }, '<s-tab>',     '<esc>v<',     opts },
    { { 'v', 'n' }, '<tab>',       '<esc>v>',     opts },

    -- 选中全文
    { { 'n', 'i', 'v' }, '<m-a>',       '<esc><esc>ggVG',    opts },
    
    -- c-s = :%s/
    { { 'n', 'v', 'i' }, '<c-h>',    '<esc>:%s//g<left><left>', opts },
    
    -- format
    { { 'n', 'i', 'v' }, '<C-S-i>', '<cmd>Format<CR>', opts },

    -- emacs风格快捷键 清空一行
    { 'n', '<c-u>',       'cc<Esc>', opts },
    { 'i', '<c-u>',       '<Esc>cc', opts },

    -- alt + 上 下移动行
    { 'n', '<m-k>',      ':m .-2<cr>',       opts },
    { 'n', '<m-j>',    ':m .+1<cr>',       opts },
    { 'i', '<m-k>',      '<Esc>:m .-2<cr>i', opts },
    { 'i', '<m-j>',    '<Esc>:m .+1<cr>i', opts },
    { 'v', '<m-k>',      ":m '<-2<cr>gv",    opts },
    { 'v', '<m-j>',    ":m '>+1<cr>gv",    opts },

    -- windows: sp 上下窗口 sv 左右分屏 sc关闭当前 so关闭其他 s方向切换
    { 'n', 'sv',          ':vsp<cr><c-w>w',   opts },
    { 'n', 'sp',          ':sp<cr><c-w>w',    opts },
    { 'n', 'sc',          ':close<cr>',       opts },
    { 'n', 'so',          ':only<cr>',        opts },
    { 'n', 'sh',     '<c-w>h',           opts },
    { 'n', 'sl',    '<c-w>l',           opts },
    { 'n', 's=',          '<c-w>=',           opts },
    { 'n', 'sk',       '<c-w>k',           opts },
    { 'n', 'sj',     '<c-w>j',           opts },
    { 'n', '<m-.>',       "winnr() <= winnr('$') - winnr() ? '<c-w>10>' : '<c-w>10<'", { noremap = true, expr = true } },
    { 'n', '<m-,>',       "winnr() <= winnr('$') - winnr() ? '<c-w>10<' : '<c-w>10>'", { noremap = true, expr = true } },

    -- buffers
    { 'n', 'bc',           ':bw<cr>',          opts },
    { 'n', 'bb',          ':bn<cr>',          opts },
    { 'n', 'bh',       ':bp<cr>',          opts },
    { 'n', 'bl',   ':bn<cr>',          opts },
    { 'v', 'bh',    '<esc>:bp<cr>',     opts },
    { 'v', 'bl',   '<esc>:bn<cr>',     opts },
    { 'i', 'bh',    '<esc>:bp<cr>',     opts },
    { 'i', 'bl',   '<esc>:bn<cr>',     opts },

})


-- 1 当目录不存在时 先创建目录, 2 当前文件是acwrite时, 用sudo保存
function MagicSave()
    if vim.fn.empty(vim.fn.glob(vim.fn.expand('%:p:h'))) then vim.fn.system('mkdir -p ' .. vim.fn.expand('%:p:h')) end
    if vim.o.buftype == 'acwrite' then
        vim.fn.execute('w !sudo tee > /dev/null %')
    else
        vim.fn.execute('w')
    end
end
