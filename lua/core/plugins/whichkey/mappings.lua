return {
  { "<leader>e", "<cmd>Neotree toggle <cr>", desc = "Open Explorer", mode = "n", icon = "󰈞" },
  { "<leader>w", "<cmd>:write <cr>", desc = "Save file", mode = "n", icon = "" },
  {
    "<leader>f",
    group = "Find",
    icon = "",
    { "<leader>ff", "<cmd> Telescope find_files <cr>", desc = "Find files", icon = "󰈞" },
    { "<leader>ft", "<cmd> Telescope live_grep <cr>", desc = "Find text", icon = "󰈞" },
  },
  { "<leader>q", "<cmd>qa <cr>", desc = "Quit Nvim", mode = "n", icon = "󰈆" },
  { "<leader>a", "<cmd>Dashboard<cr>", desc = "Dashboard", mode = "n", icon = "󰈞" },
  {
    "<leader>g",
    group = "Git",
    icon = "",
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status", icon = "" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add", icon = "" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit", icon = "" },
    { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Git blame toggle", icon = "" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git diff", icon = "" },
    { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit", icon = "" },
  },
  {
    "<leader>l",
    group = "LSP",
    icon = "󰈙",
    { "<leader>ls", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show diagnostic" },
    {
      "<leader>lf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = true,
        })
      end,
      desc = "Format buffer",
    },
  },
  {
    "<leader>v",
    group = "Split",
    icon = "󰨑",
    { "<leader>vs", "<cmd>vsplit<cr>", desc = "Vertical split", icon = "󰈞" },
  },
  {
    "<leader>b",
    group = "Buffer",
    icon = "",
    { "<leader>bb", "<cmd>bd<cr>", desc = "Close buffer", icon = "󰈞" },
    { "<leader>bc", "<cmd>%bd|e#|bd#<cr>", desc = "Close other buffers", icon = "󰈞" },
  },
}
