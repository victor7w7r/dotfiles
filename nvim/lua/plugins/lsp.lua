local signs = {
  Error = " ",
  Warn = "",
  Hint = "󰌶",
  Information = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
        opts = {}
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {},
        config = function()
          local get_servers = require('mason-lspconfig').get_installed_servers

          for _, server_name in ipairs(get_servers()) do
            require('lspconfig')[server_name].setup({})
          end
        end
      },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local lspzero = require("lsp-zero")

      lspzero.preset({
        virt_text = true,
        suggest_lsp_servers = true,
        setup_servers_on_start = true,
        configure_diagnostics = true,
        -- cmp_capabilities = true,
        call_servers = 'local',
        set_lsp_keymaps = { preserve_mappings = true, omit = {} },
      })

      -- Virtual Text Config
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = {
            prefix = "󱓻",
            spacing = 2,
          },
          underline = true,
        }
      )

      lspzero.setup()
    end
  },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- VSCode Icons
  { "onsails/lspkind.nvim" }
}
