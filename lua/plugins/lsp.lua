local util = require "lspconfig/util"

local settings = {
  -- Default mappings
  -- gD = 'lua vim.lsp.buf.declaration()',
  -- gd = 'lua vim.lsp.buf.definition()',
  -- gt = 'lua vim.lsp.buf.type_definition()',
  -- gi = 'lua vim.lsp.buf.implementation()',
  -- gr = 'lua vim.lsp.buf.references()',
  -- K = 'lua vim.lsp.buf.hover()',
  -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
  -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
  -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
  -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
  -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
  -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
  -- [']d'] = 'lua vim.diagnostic.goto_next()',
  default_mappings = true,
  mappings = {
    ["<C-]>"] = 'lua vim.lsp.buf.definition()',
  },
  servers = {
    eslint = {},
    pylsp = {},
    zk = {},
    jsonls = {},
    bashls = {},
    tsserver = {},
    dockerls = {},
    jsonnet_ls = {},
    gopls = {
      cmd = { "gopls", "serve" },
      filetypes = { "go", "gomod" },
      root_dir = util.root_pattern("go.work", "go.mod", "src", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    },
    clangd = {},
    sumneko_lua = {},
  },
}

require('lsp-setup').setup(settings)

-- global config for diagnostic
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = false,
  severity_sort = true,
})

require('lsp_signature').setup()
require('lsp-colors').setup()

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
