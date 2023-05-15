-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require("util")
local map = util.map

-- table prev and next
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- remove whitespace
map("n", "<leader><Space>", "<Cmd>StripTrailingWhitespace<CR>", { desc = "Remove whitespace" })

-- Replace visual selection with text in register, but not contaminate the
-- register, see also https://stackoverflow.com/q/10723700/6064933.
map("x", "p", '"_c<ESC>p')

-- close current buffer
map("", "<C-q>", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>")

-- toggle tree
map("n", "<leader>t", function()
	local api = require("nvim-tree.api")
	api.tree.close()
	api.tree.open({
		path = vim.fn.expand("%:p:h"),
	})
end, {
	desc = "Toggle nvim-tree",
})

-- close all plugin window
map("", "<C-C><C-C>", util.close_plugin_window, { desc = "Close all plugin windows" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })


local telescope = require('telescope.builtin')
map("", "<C-p>", telescope.find_files, { desc = "Find files" })
map("", '<leader>g', telescope.grep_string, { desc = "Word (root dir)" })
map("v", 'gs', function()
	local text = util.get_visual_selection()
	telescope.live_grep { default_text = text }
end, { desc = "Search select string" })

-- 转换选中字符串，然后写入粘贴板
map("v", '<leader>y', function()
	local ret = util.select_convert_case()
	vim.fn.setreg('+', ret)
	vim.fn.setreg('"', ret)
	 -- Exit visual mode.
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'x', false)
end, { desc = "Convert select string" })

