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
      "gitcommit",
      "git_rebase",
      "gitattributes",
      "git_config",
      "dot",
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
      callback = function(args)
        if vim.bo[args.buf].buftype ~= "" then
          return
        end

        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
