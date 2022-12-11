local wild_ignore = {
    dir = {
        ".git",
        "__pycache__",
        ".DS_Store",
    },
    file = {
        "*.exe",
        "*.dll",
        "*.so",
        "*.a",
        "*.o",
        "*.pyc",
        "*.jpg",
        "*.png",
        "*.gif",
        "*.svg",
        "*.ico",
        "*.db",
        "*.tgz",
        "*.tar.gz",
        "*.gz",
        "*.zip",
        "*.bin",
        "*.pptx",
        "*.xlsx",
        "*.docx",
        "*.pdf",
        "*.tmp",
        "*.wmv",
        "*.mkv",
        "*.mp4",
        "*.rmvb",
        "*.ttf",
        "*.ttc",
        "*.otf",
        "*.mp3",
        "*.aac",
    },
}
vim.g.Lf_WildIgnore = wild_ignore

vim.g.Lf_UseCache = 0
vim.g.Lf_UseMemoryCache = 0
vim.g.Lf_DefaultMode = "FullPath"
vim.g.Lf_WindowHeight = 0.30
vim.g.Lf_UseVersionControlTool = 0
vim.g.Lf_DefaultExternalTool = "find"
vim.g.Lf_ShowHidden = 1
vim.g.Lf_ShortcutF = ""
vim.g.Lf_ShortcutB = ""
vim.g.Lf_WorkingDirectoryMode = "a"
vim.g.Lf_PythonVersion = 3
vim.g.Lf_StlColorscheme = "solarized"
vim.g.Lf_StlSeparator = {
    left = "",
    right = "",
}

local map = require("utils").map
map("n", "<C-p>", "<Cmd>Leaderf file<CR>")
map("n", "<leader>fg", "<Cmd>Leaderf rg --no-messages<CR>")
map("n", "<leader>fh", "<Cmd>Leaderf help<CR>")
map("n", "<leader>ft", "<Cmd>Leaderf bufTag<CR>")
map("n", "<leader>fb", "<Cmd>Leaderf buffer<CR>")
map("n", "<leader>fr", "<Cmd>Leaderf mru --absolute-path<CR>")

-- 搜索选中的字符串，对结果按 i 支持二次过滤
vim.g.Lf_RgConfig = {
    "--max-columns=150",
    "--type-add proto:*.proto",
    "--glob=!git/*",
    "--follow --no-ignore",
}

vim.g.Lf_Filetypes = "-t proto -t c -t py -t lua -t vim -t sh -t go -t json -t xml -t js -t cpp"
-- select gs searce select word
map(
    "x",
    "gs",
    ':<C-U><C-R>=printf("Leaderf! rg -F %s --nowrap --stayOpen -e %s ", g:Lf_Filetypes, leaderf#Rg#visual())<cr><cr>'
)

-- leader g search current word
map(
    "n",
    "<leader>g",
    ':<C-U><C-R>=printf("Leaderf! rg -F %s --nowrap --stayOpen -e %s ", g:Lf_Filetypes, expand("<cword>"))<cr><cr>'
)
