return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local servers = require('config.servers')

    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_enabled = false,
    })

    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [severity.ERROR] = " ",
          [severity.WARN] = " ",
          [severity.HINT] = "󰠠 ",
          [severity.INFO] = " ",
        },
      },
    })
  end,
}
