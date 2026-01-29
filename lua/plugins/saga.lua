return {
  "nvimdev/lspsaga.nvim",
  event = "VeryLazy",
  config = function()
    local saga = require("lspsaga")

    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc <cr>", { silent = true, noremap = true, desc = "Hover Doc" })
    vim.keymap.set(
      "n",
      "gr",
      "<cmd>Lspsaga finder <cr>",
      { silent = true, noremap = true, desc = "Find References" }
    )
    vim.keymap.set(
      "n",
      "gd",
      "<cmd>Lspsaga goto_definition <cr>",
      { silent = true, noremap = true, desc = "Go to definition" }
    )
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, { silent = true, noremap = true, desc = "Rename" })

    saga.setup({
      diagnostic = {
        show_code_action = false,
        diagnostic_only_current = true,
        max_height = 0.8,
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
      finder = {
        keys = {
          toggle_or_open = "<CR>",
        },
      },
    })
  end,
}
