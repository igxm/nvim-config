return {
	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
				sources = {
					nls.builtins.formatting.fish_indent,
					nls.builtins.diagnostics.fish,
					-- nls.builtins.formatting.stylua,
					nls.builtins.formatting.shfmt,
					-- nls.builtins.diagnostics.flake8,
				},
			}
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
			},
		},
	},

	-- add lspconfig
	{
		"neovim/nvim-lspconfig",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = { "<C-]>", vim.lsp.buf.definition, desc = "Goto definition" }
			keys[#keys + 1] = { "gr", function() require('telescope.builtin').lsp_references({jump_type='never'}) end, desc = "References" }
		end,
		---@class PluginLspOpts
		opts = {
			diagnostics = {
				underline = false,
				virtual_text = false,
				signs = false,
				severity_sort = true,
			},
			---@type lspconfig.options
			servers = {
				gopls = {
					analyses = {
						nilness = false,
						shadow = false,
						unusedparams = false,
						unusewrites = false,
                    },
                    staticcheck = false,
					usePlaceholders = true,
					cmd = { "gopls", "-remote=auto" },
				},
				lua_ls = {
					mason = false,
					enabled = false
				},
			},
		},
	}
}
