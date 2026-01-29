return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  cmd = "Persistence",
  opts = {
    options = { "buffers", "curdir", "tabpages", "winsize" },
  },
}
