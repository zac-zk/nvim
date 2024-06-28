local opt = vim.opt

opt.autoread = true
opt.autowrite = true

opt.clipboard = "unnamedplus"

opt.shiftround = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

opt.number = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

opt.mouse = "a"
opt.cursorline = true

opt.showmode = true
opt.scrolloff = 8
opt.completeopt = { "menuone", "noselect" }
opt.list = true
-- opt.listchars = "space:."
opt.cursorline = true
opt.undofile = true
opt.undolevels = 1000
opt.wrap = true
opt.conceallevel = 3
opt.confirm = true
opt.inccommand = "nosplit"
opt.laststatus = 2
opt.pumblend = 10
opt.pumheight = 10
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append({ W = true, I = true, c = true })
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.updatetime = 200
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
