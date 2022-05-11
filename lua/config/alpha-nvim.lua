local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "Ctrl p", "  > Find file", ":Leaderf file --popup<CR>"),
    dashboard.button( "Leader f r", "  > Recent files"   , ":Leaderf mru --popup<CR>"),
    dashboard.button( "Leader f g", "  > Project grep" , ":Leaderf rg --popup<CR>"),
    dashboard.button( "u", "  > Update plugins" , ":PackerSync<CR>"),
    dashboard.button( "e", "  > New file" , ":enew <CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

local function footer()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
end
dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)

-- Send config to alpha
alpha.setup(dashboard.opts)
