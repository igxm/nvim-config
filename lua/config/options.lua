-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Leader key
vim.g.mapleader = ","

-- Color scheme
vim.o.termguicolors = true

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fencs = "utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936"
vim.o.hidden = true
vim.o.wildmenu = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.matchtime = 1
vim.o.showmatch = true
vim.o.updatetime = 100
vim.o.ignorecase = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.ruler = true
vim.o.history = 500
vim.o.backup = false
vim.o.swapfile = false
vim.o.foldenable = false
vim.o.autoread = true
vim.o.autowrite = true
vim.o.mouse = "a"

vim.o.number = true
vim.o.cursorline = true
vim.o.relativenumber = false
vim.o.cursorcolumn = true
-- vim.o.cmdheight = 0
vim.opt.list = true
vim.opt.listchars = {
	tab = "▸ ",
	extends = "❯",
	precedes = "❮",
	nbsp = "␣",
}

vim.o.textwidth = 120
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- filetype
local cmd = vim.cmd
local ncmd = vim.api.nvim_command
ncmd("filetype plugin indent on")
cmd([[ autocmd FileType lua setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 noexpandtab]])
cmd([[ autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 ]])
cmd([[ autocmd FileType json,jsonnet setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 noexpandtab ]])
cmd([[ autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])
cmd([[ autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 expandtab ]])
cmd([[ autocmd FileType less,sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType javascript,javascript.jsx,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType NvimTree setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])
cmd([[ autocmd BufNewFile,BufRead *.proto setfiletype proto ]])
cmd([[ autocmd FileType proto setlocal shiftwidth=4 expandtab ]])
