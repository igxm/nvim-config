local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim/plugin/packer.lua"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

local utils = require("utils")
require("packer").startup({
  config = {
    compile_path = compile_path,
  },
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use({
      "lewis6991/impatient.nvim",
      config = [[require("impatient")]],
    })

    use("wbthomason/packer.nvim")

    use({
      "catppuccin/nvim",
      config = [[require("plugins.catppuccin")]],
    })

    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      event = "VimEnter",
      config = [[require("plugins.statusline")]],
    })

    use("kyazdani42/nvim-web-devicons")

    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "VimEnter",
      config = [[require("plugins.indent-blankline")]],
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "RRethy/nvim-treesitter-endwise",
        "andymass/vim-matchup", -- extend % key
        "yioneko/nvim-yati",
        "m-demare/hlargs.nvim",
      },
      config = function()
        require("hlargs").setup()
        require("plugins.treesitter")
      end,
    })

    -- Show match number and index for searching
    use({
      "kevinhwang91/nvim-hlslens",
      branch = "main",
      keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
      config = [[require("plugins.hlslens")]],
    })

    -- Stay after pressing * and search selected text
    use({
      "haya14busa/vim-asterisk",
      event = "VimEnter",
    })

    -- File search, tag search and more
    use({
      "Yggdroot/LeaderF",
      run = ":LeaderfInstallCExtension",
      config = [[require("plugins.leaderf")]],
    })

    -- Show git change (change, delete, add) signs in vim sign column
    use({
      "mhinz/vim-signify",
      event = "BufEnter",
    })

    -- Highlight URLs inside vim
    use({
      "itchyny/vim-highlighturl",
      event = "VimEnter",
    })

    -- notification plugin
    use({
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function() require("plugins.nvim-notify") end, 2000)
      end,
    })

    use({
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end,
    })

    use("RRethy/nvim-align")

    -- Show undo history visually
    use({
      "simnalamburt/vim-mundo",
      cmd = { "MundoToggle", "MundoShow" },
    })

    -- Auto format tools
    use({
      "sbdchd/neoformat",
      cmd = { "Neoformat" },
    })

    -- Git command inside vim
    use({
      "tpope/vim-fugitive",
      event = "User InGitRepo",
    })

    -- markdown plugin
    use({
      "plasticboy/vim-markdown",
      ft = { "markdown" },
    })

    -- Faster footnote generation
    use({
      "vim-pandoc/vim-markdownfootnotes",
      ft = { "markdown" }
    })

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use({
      "godlygeek/tabular",
      cmd = { "Tabularize" },
    })

    -- Markdown JSON header highlight plugin
    use({
      "elzr/vim-json",
      ft = { "json", "markdown" },
    })

    -- Markdown previewing (only for Mac and Windows)
    if vim.g.is_win or vim.g.is_mac then
      use({
        "iamcco/markdown-preview.nvim",
        run = function()
          fn["mkdp#util#install"]()
        end,
        ft = { "markdown" },
      })
    end

    -- close hide buffer
    use("kazhala/close-buffers.nvim")

    -- osc52 yank
    use({
      "ojroques/vim-oscyank",
      config = [[require("plugins.oscyank")]],
    })

    -- Only install these plugins if ctags are installed on the system
    if utils.executable("ctags") then
      -- show file tags in vim window
      use({
        "liuchengxu/vista.vim",
        cmd = "Vista",
      })
    end

    -- Autosave files on certain events
    use({
      "Pocco81/auto-save.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require("plugins.autosave") end, 1500)
      end,
    })

    -- The missing auto-completion for cmdline!
    use({
      "gelguy/wilder.nvim",
      config = [[require("plugins.wilder")]],
    })

    -- showing keybindings
    use({
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require("plugins.which-key") end, 2000)
      end,
    })

    -- show and trim trailing whitespaces
    use({
      "jdhao/whitespace.nvim",
      event = "VimEnter",
    })

    -- file explorer
    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = [[require("plugins.nvim-tree")]],
    })

    -- tabline
    use({
      "akinsho/bufferline.nvim",
      requires = {
        "catppuccin/nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = [[require("plugins.bufferline")]],
    })

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ",
        "hrsh7th/cmp-buffer",
        "onsails/lspkind-nvim",
      },
      config = function()
        require("plugins.nvim-cmp")
      end,
    })

    use({
      "junnplus/lsp-setup.nvim",
      requires = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/lsp-colors.nvim",
        "folke/lua-dev.nvim",
      },
      config = function()
        require("plugins.lsp")
      end,
    })
  end
})
