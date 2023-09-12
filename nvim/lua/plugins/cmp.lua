local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

return {
  -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp",     lazy = false },
  { "hrsh7th/cmp-nvim-lua",     lazy = false },
  { "hrsh7th/cmp-buffer",       lazy = false },
  { "hrsh7th/cmp-path",         lazy = false },
  { "saadparwaiz1/cmp_luasnip", lazy = false },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")

      cmp.sources = {
        { name = 'cmp_luasnip' },
        { name = 'tsserver' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'tailwindcss' },
        { name = 'astro' },
        { name = 'eslint' },
        { name = 'html' },
        { name = 'inteliphense' },
        { name = 'rust_analyzer' },
        { name = 'json_ls' },
        { name = 'emmet_ls' },
        { name = 'cssls' }
      }
    end,
    config = function()
      local cmp = require("cmp")
      local lspkind = require('lspkind')

      cmp.setup({
        view = {
          entries = 'custom',
          selection_order = 'near_cursor'
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            cmp.config.window.bordered(),
          }
        },
        formatting = {
          format = function(entry, vim_item)
            return 'Messi!!!'
          end
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-i>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<tab>'] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },
}
