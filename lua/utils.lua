local M = {}

-- check executable file
function M.executable(name)
    if vim.fn.executable(name) > 0 then
        return true
    end
    return false
end

function M.map(modes, lhs, rhs, opts)
    -- noremap = true, slient = true, expr = false
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == "string" then
        modes = {
            modes,
        }
    end
    for _, mode in ipairs(modes) do
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

vim.cmd([[
" 关闭插件窗口
function! ClosePluginWindow() abort
  " Close quickfix
  cclose

  " Close Leaderf Buffer
  redir => message
  silent execute "ls!"
  redir END
  let l:buflist = split(message, '\n')
  for l:one in l:buflist
    let l:items = split(l:one, '"')
    if match(l:items[0], "u*a-") >= 0
      let l:bufid = matchstr(l:items[0], '\d\+')
      exe 'bd! '.l:bufid
    endif
  endfor
endfunction
]])

-- Close current window and all its floating subwindows
function M.close_plugin_window()
    vim.fn["ClosePluginWindow"]()
    local this_win = vim.fn.win_getid()
    -- close all floating windows that are relative to the current one
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local win_config = vim.api.nvim_win_get_config(win)
        -- If the mapping doesn't close enough windows, use the following line instead:
        -- if win_config.relative ~= "" then
        if win_config.relative == "win" and win_config.win == this_win then
            vim.api.nvim_win_close(win, false)
        end
    end

    local close_buffers = require("close_buffers")
    close_buffers.delete({
        type = "nameless",
    })
end

return M
