local utils = require('utils')
local map = utils.map

-- Leader key
vim.g.mapleader = ','

-- remove whitespace
map('n', '<leader><Space>', '<Cmd>StripTrailingWhitespace<CR>')

-- undo toggle
map('n', '<leader>u', '<Cmd>MundoToggle<CR>')

-- vista
map('n', '<leader>v', '<Cmd>Vista!!<CR>')

-- Replace visual selection with text in register, but not contaminate the
-- register, see also https://stackoverflow.com/q/10723700/6064933.
map('x', 'p', '"_c<ESC>p')

-- close all plugin window
map('', '<C-C><C-C>', function() utils.close_plugin_window() end)

-- close current buffer
map('', '<C-q>', '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>')

