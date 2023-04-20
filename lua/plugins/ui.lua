-- stylua: ignore
return {
	-- theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-latte",
		},
	},

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"vimdoc",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"go",
				'dockerfile',
				'git_config',
				'jsdoc',
				'make',
				'toml',

			},
		},
	},

	-- tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			hijack_netrw = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "p", api.node.navigate.parent, opts("Parent Directory"))
			end,
		},
	},

	-- tab line
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = {
					"bold",
				},
			}),
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = function(opts)
					return string.format("%s", opts.raise(opts.ordinal))
				end,
				close_command = nil, -- can be a string | function, see "Mouse actions"
				right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				left_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				always_show_bufferline = true,
				sort_by = "id",
				separator_style = "thin",
				enforce_regular_tabs = false,
				color_icons = true,  -- whether or not to add the filetype icon highlights
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = false,
				show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
				show_close_icon = false,
				show_tab_indicators = false,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local icons = require("lazyvim.config").icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
					},
				},
			},
		},
	},

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				section_separators = "",
				component_separators = "",
				disabled_filetypes = {},
				always_divide_middle = true,
			},
			extensions = {
				"quickfix",
				"fugitive",
				"nvim-tree",
			},
		},
	},

	-- disable commond line
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
			},
			popupmenu = {
				enabled = false,
			},
			messages = {
				enabled = true,
			},
			routes = {
				{
					view = "mini",
					filter = {
						event = { "msg_show", "msg_showmode" },
						["not"] = {
							kind = { "confirm", "confirm_sub" },
						},
					},
				},
				{
					filter = {
						event = "cmdline",
						find = "^%s*[/?]",
					},
					view = "cmdline",
				},
			},
		},
	},
}
