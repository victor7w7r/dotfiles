-- This plugin handles session persistence
return {
  "folke/persistence.nvim",
  lazy = false,
  config = function()
    local persistence = require("persistence")

    persistence.setup()
    persistence.load()
  end,
}
