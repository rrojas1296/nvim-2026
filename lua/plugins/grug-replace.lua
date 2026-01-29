return {
  "MagicDuck/grug-far.nvim",
  config = function()
    local grug = require("grug-far")
    grug.setup({
      prefills = {
        path2 = vim.fn.expand("%")
      }
    })
  end,
}
