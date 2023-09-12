return {
  -- Init screenui
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' }
    },
  },

  -- Better popup menus
  { 'stevearc/dressing.nvim' },

  -- Theme
  {
    -- "folke/tokyonight.nvim",
    "catppuccin/nvim",
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,          -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,        -- percentage of the shade to apply to the inactive window
        },
        styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },  -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = { "italic" },
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          gitsigns = true,
          cmp = true,
          lsp_trouble = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          neotree = true,
          leap = true,
          symbols_outline = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
        },
      })

      vim.opt.termguicolors = true
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Upper bar
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("barbecue").setup()
    end,
  },

  -- NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e",  "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree alt" },
      { "<leader>fe", "<cmd>Neotree focus<cr>",  desc = "Focus Neotree" }
    },
    opts = {
      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          indent_size = 2,
          padding = 1,
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",

          default = "󰈙",
          highlight = "NeoTreeFileIcon"
        },
        modified = {
          symbol = "󰝥",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "A",
            modified  = "M",
            deleted   = "D",
            renamed   = "R",
            -- Status type
            untracked = "U",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "󰱒",
            conflict  = "󰄷",
          }
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false
          }
        }
      }
    }
  },

  -- Context Navigation
  {
    'simrat39/symbols-outline.nvim',
    keys = {
      { '<leader>a', '<cmd>SymbolsOutline<cr>' }
    },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { '', '' },
      wrap = false,
      keymaps = {
        -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "", hl = "@type" },
        Method = { icon = "", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "", hl = "@type" },
        Interface = { icon = "", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "", hl = "@string" },
        Number = { icon = "󰉻", hl = "@number" },
        Boolean = { icon = "", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "", hl = "@type" },
        Key = { icon = "", hl = "@type" },
        Null = { icon = "󰟢", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "", hl = "@type" },
        Event = { icon = "🗲", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
      },
    }
  },

  -- Status line
  {
    "feline-nvim/feline.nvim",
    config = function()
      require("feline").setup {
        components = require("catppuccin.groups.integrations.feline").get(),
      }
    end,
  },

  -- Guide lines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
        indent = 1,
      })
    end
  }
}