vim.g.mapleader = " "

local tabwidth = 2
local opt = vim.opt

opt.path:append('**')
opt.number = true
opt.hidden = true

opt.writebackup = false
opt.swapfile = false
opt.endofline = false

opt.tabstop = tabwidth
opt.softtabstop = tabwidth
opt.shiftwidth = tabwidth
opt.expandtab = true -- spaces not tabs
opt.smartindent = true
opt.shiftround = true

opt.linebreak = true
opt.wrap = false
opt.textwidth = 80

opt.wildignorecase = true
opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes'
opt.cursorline = true
opt.confirm = true
opt.completeopt = "menu,menuone,noselect"
opt.list = true
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 4
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.spelllang = { "en" }
opt.termguicolors = true
opt.timeoutlen = 300
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.smoothscroll = true
opt.foldmethod = "expr"

opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.winminwidth = 5

opt.undofile = true
opt.undolevels = 10000

opt.mouse = 'a'

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

opt.cmdheight = 0
