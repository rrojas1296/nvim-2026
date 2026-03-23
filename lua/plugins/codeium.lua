return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local codeium = require('codeium')
    codeium.setup({
      enable_cmp_source = false,
      virtual_text = {
        enabled = true
      }
    })
  end
}
