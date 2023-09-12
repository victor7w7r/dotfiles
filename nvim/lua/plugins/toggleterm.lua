return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup()
  end,
  keys = {
    { "<c-t>", "<cmd>ToggleTerm size=10 direction=horizontal<cr>" }
  }
}
