return {
  {
    "nvim-lua/plenary.nvim"
  },

  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
      settings = {
        live_blame = {
          enabled = true
        }
      }
    }
  },

  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },

  { "nvim-lua/plenary.nvim" }
}
