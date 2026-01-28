return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local colorschema = vim.cmd.colorscheme
    colorschema("tokyonight-night")
  end,
}
