return {
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		keys = {
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "Find Plugin File",
			},
		},
		opts = {
			defaults = {
				file_ignore_patterns = { "logs/.*", "log/.*" },
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				vimgrep_arguments = {
					'rg',
					[[--glob=!*.pb.go]],
					[[--glob=!*protoop.go]],
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'-u',
				},
			},
			pickers = {
				find_files = {
					find_command = {
						'rg',
						'--files',
						'--color',
						'never',
						'--no-require-git',
						'-u',
					}
				}
			},
		},
	},
}