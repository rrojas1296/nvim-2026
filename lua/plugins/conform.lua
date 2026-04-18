return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        prisma = { "prisma" },
        htmlangular = { "prettier" },
        vue = { "prettier" }
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        if vim.bo[args.buf].filetype == "prisma" then
          return
        end

        require("conform").format({
          bufnr = args.buf,
          timeout_ms = 5000,
          lsp_fallback = true,
        })
      end,
    })
  end,
}
