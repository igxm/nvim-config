vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        notify = true,
        nvimtree = true,
        treesitter = true,
        treesitter_context = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = {
                    "italic",
                },
                hints = {
                    "italic",
                },
                warnings = {
                    "italic",
                },
                information = {
                    "italic",
                },
            },
            underlines = {
                errors = {
                    "underline",
                },
                hints = {
                    "underline",
                },
                warnings = {
                    "underline",
                },
                information = {
                    "underline",
                },
            },
        },
    },
})

vim.cmd("colorscheme catppuccin-latte")
