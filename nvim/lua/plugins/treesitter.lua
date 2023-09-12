return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "javascript",
          "rust",
          "typescript",
          "lua",
          "vue"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    config = function()
      require('treesitter-context').setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (f
      })
    end
  }
}
