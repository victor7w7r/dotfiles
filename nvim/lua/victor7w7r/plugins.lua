local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use "github/copilot.vim"

  -- Theme
  use { "folke/tokyonight.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require('dashboard').setup {}
    end,
    requires = { { 'nvim-tree/nvim-web-devicons' } },

  }

  -- Sessions
  use {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  }

  -- Status line
  use "b0o/incline.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- Floating terminal
  use "voldikss/vim-floaterm"

  -- Git
  use { 'tanvirtin/vgit.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use "nvim-lua/plenary.nvim"

  -- File editing
  use { "onsails/lspkind.nvim" }
  use { "ggandor/leap.nvim" }
  use { "mg979/vim-visual-multi" }
  use { "gbprod/yanky.nvim" }
  use { "petertriho/nvim-scrollbar" }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use { 'simrat39/rust-tools.nvim' }

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end,
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional
    },
    config = function()
      require("barbecue").setup()
    end,
  }
  use { 'sQVe/sort.nvim' }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }
  use { 'jiangmiao/auto-pairs' }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  }

  -- Debugging (WIP)
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use "mfussenegger/nvim-dap"
  use "marus/cortex-debug"

  -- File Mgmt
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use { "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use "nvim-telescope/telescope-file-browser.nvim"
  use "sbdchd/neoformat"

  -- File Decorations
  use "lukas-reineke/indent-blankline.nvim"

  -- Syntax Highlighting
  use "nvim-treesitter/nvim-treesitter"

  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  -- Misc.
  use 'andweeb/presence.nvim'

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)