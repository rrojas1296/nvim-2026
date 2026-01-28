return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local theme = require("tokyonight")
    local colorschema = vim.cmd.colorscheme
    colorschema("tokyonight-moon")
  end,
}
