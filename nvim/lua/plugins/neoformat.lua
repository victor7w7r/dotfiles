local g = vim.g

g.neoformat_try_node_exe = 1

return {
  "sbdchd/neoformat",
  keys = {
    { "<leader>ft",  "<cmd>Neoformat<cr>" },
    { "<leader>pft", "<cmd>!pnpm format<cr>" }
  },
  lazy = false,
  config = function()
    vim.cmd [[
      autocmd BufWritePre *.astro,*.md,*.vue,*.js,*.ts,*.tsx,*.json Neoformat
    ]]
  end
}
