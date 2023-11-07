return {
	{ "flash.nvim",                                  enabled = false },
	{ "dashboard-nvim",                              enabled = false },
	--{ "folke/trouble.nvim",                          enabled = false },
	--{ "echasnovski/mini.surround",                   enabled = false },
	--{ "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
	--{ "echasnovski/mini.comment",                    enabled = false },
	--{ "echasnovski/mini.ai",                         enabled = false },
	--{ "nvim-pack/nvim-spectre",                      enabled = false },
	--{ "ggandor/flit.nvim",                           enabled = false },
	--{ "ggandor/leap.nvim",                           enabled = false },
	--{ "echasnovski/mini.bufremove",                  enabled = false },
	--{ "goolord/alpha-nvim",                          enabled = false },
	--{ "echasnovski/mini.starter",                    enabled = false },
	--{ "tpope/vim-repeat",                            enabled = false },
	{
		"LazyVim/LazyVim",
		opts = {
			defaults = {
				autocmds = true, -- lazyvim.config.autocmds
				keymaps = false, -- lazyvim.config.keymaps
				options = true, -- lazyvim.config.options
			},
		}
	}
}
