return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install({
      "angular",
      "astro",
      "bash",
      "css",
      "dart",
      "dot",
      "fish",
      "git_config",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "git_rebase",
      "go",
      "graphql",
      "html",
      "javascript",
      "json",
      "kitty",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "nginx",
      "prisma",
      "python",
      "sql",
      "tmux",
      "tsx",
      "typescript",
      "vim",
      "vue",
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
  end
}
