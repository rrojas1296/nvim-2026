return {
  "Exafunction/windsurf.nvim",
  config = function()
    local codeium = require("codeium")
    codeium.setup({
      virtual_text = {
        enabled = true,
      },
    })
  end,
}
