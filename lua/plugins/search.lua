return {
	--[=[
	--
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
				"<C-p>",
				require("telescope.builtin").find_files,
				desc = "Find File",
			},
			{
				"<leader>g",
				require("telescope.builtin").grep_string,
				desc = "Word (root dir)",
			},
			{
				"gs",
				function()
					local util = require("util")
					local telescope = require("telescope.builtin")
					local text = util.get_visual_selection()
					telescope.live_grep({ default_text = text })
				end,
				mode = { "v" },
				desc = "Search select string",
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
					"rg",
					[[--glob=!**/logs/**]],
					[[--glob=!**/log/**]],
					[[--glob=!*.pb.go]],
					[[--glob=!*protoop.go]],
					[[--glob=!*base_redisop.go]],
					[[--glob=!*redismsg_redisop.go]],
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"-u",
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--color",
						"never",
						"--no-require-git",
						"-u",
					},
				},
			},
		},
	},
	--]=]
}
