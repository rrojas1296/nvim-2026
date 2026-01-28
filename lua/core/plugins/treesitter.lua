return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install({
      "typescript",
      "javascript",
      "html",
      "graphql",
      "sql",
      "angular",
      "astro",
      "bash",
      "css",
      "dart",
      "fish",
      "gitignore",
      "go",
      "json",
      "kitty",
      "lua",
      "luadoc",
      "markdown",
      "make",
      "nginx",
      "prisma",
      "python",
      "tmux",
      "tsx",
      "vim",
      "zsh",
    })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = { "*" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
