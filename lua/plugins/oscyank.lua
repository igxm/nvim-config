local function copy(lines, _)
    vim.fn.OSCYankString(table.concat(lines, "\n"))
end

local function paste()
    return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
    }
end

vim.g.clipboard = {
    name = "osc52",
    copy = {
        ["+"] = copy,
        ["*"] = copy,
    },
    paste = {
        ["+"] = paste,
        ["*"] = paste,
    },
}

vim.g.oscyank_term = "default"
vim.cmd([[
set clipboard+=unnamedplus
]])
