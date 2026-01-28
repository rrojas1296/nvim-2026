return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        theme = "dropdown",
      },
    },
    defaults = {
      file_ignore_patterns = { "node_modules", ".git", ".next", "build" },
      prompt_prefix = " ",
      selection_caret = "  ",
    },
  },
}
