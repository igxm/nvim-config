local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.stylua,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
                vim.lsp.buf.format({
                    bufnr = bufnr,
                })
            end, {})
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                command = "undojoin | LspFormatting",
            })
        end
    end,
})

require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = true,
})
