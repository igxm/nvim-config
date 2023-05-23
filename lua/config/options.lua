-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Leader key
vim.g.mapleader = ","

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fencs = "utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936"

opt.matchtime = 1
opt.updatetime = 100
opt.foldenable = false
opt.swapfile = false
opt.backup = false
opt.autoread = true
opt.autowrite = true

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.cursorcolumn = true

opt.smarttab = true
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.cindent = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.textwidth = 120

-- filetype
local cmd = vim.cmd
local ncmd = vim.api.nvim_command
ncmd("filetype plugin indent on")
cmd([[ autocmd FileType lua setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 noexpandtab]])
cmd([[ autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 ]])
cmd([[ autocmd FileType json,jsonnet setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType go,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 noexpandtab ]])
cmd([[ autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])
cmd([[ autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 expandtab ]])
cmd([[ autocmd FileType less,sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType javascript,javascript.jsx,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType NvimTree setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])
cmd([[ autocmd BufNewFile,BufRead *.proto setfiletype proto ]])
cmd([[ autocmd FileType proto setlocal shiftwidth=4 expandtab ]])
