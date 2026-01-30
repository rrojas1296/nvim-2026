return {
  "MagicDuck/grug-far.nvim",
  config = function()
    local grug = require("grug-far")
    grug.setup({
      prefills = {
        path = vim.fn.expand("%")
      }
    })
  end,
}
