local map = require("utils").map

map("n", "<leader>t", function()
    local api = require("nvim-tree.api")
    api.tree.close()
	api.tree.open({
		path = vim.fn.expand("%:p:h"),
	})
end, {
    desc = "toggle nvim-tree",
})

local nvim_tree = require("nvim-tree")

local mappings_list = {
    -- user mappings go here
    {
        key = "u",
        action = "dir_up",
    },
    {
        key = "p",
        action = "parent_node",
    },
    {
        key = "<C-v>",
        action = "vsplit",
    },
    {
        key = "<C-x>",
        action = "split",
    },
    {
        key = "I",
        action = "toggle_git_ignored",
    },
    {
        key = "H",
        action = "toggle_dotfiles",
    },
    {
        key = "U",
        action = "toggle_custom",
    },
    {
        key = "R",
        action = "refresh",
    },
    {
        key = "a",
        action = "create",
    },
    {
        key = "d",
        action = "remove",
    },
    {
        key = "D",
        action = "trash",
    },
    {
        key = "r",
        action = "rename",
    },
    {
        key = "<C-r>",
        action = "full_rename",
    },
    {
        key = "X",
        action = "cut",
    },
    {
        key = "C",
        action = "copy",
    },
    {
        key = "P",
        action = "paste",
    },
    {
        key = "y",
        action = "copy_name",
    },
    {
        key = "Y",
        action = "copy_path",
    },
    {
        key = "gy",
        action = "copy_absolute_path",
    },
    {
        key = "q",
        action = "close",
    },
    {
        key = "W",
        action = "collapse_all",
    },
    {
        key = "E",
        action = "expand_all",
    },
    {
        key = "S",
        action = "search_node",
    },
    {
        key = "<C-k>",
        action = "toggle_file_info",
    },
    {
        key = "?",
        action = "toggle_help",
    },
}

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 'u',     api.tree.change_root_to_parent,        opts('Up'))
	vim.keymap.set('n', 'p',     api.node.navigate.parent,              opts('Parent Directory'))

end

nvim_tree.setup({
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
	on_attach = on_attach,
    view = {
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {
                        "notify",
                        "packer",
                        "qf",
                        "diff",
                        "fugitive",
                        "fugitiveblame",
                    },
                    buftype = {
                        "nofile",
                        "terminal",
                        "help",
                    },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
        },
    },
})
