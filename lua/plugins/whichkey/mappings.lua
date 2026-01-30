return {
  { "<leader>e", "<cmd>Neotree toggle <cr>", desc = "Open Explorer", mode = "n", icon = "󰈞 " },
  { "<leader>w", "<cmd>:write <cr>", desc = "Save file", mode = "n", icon = " " },
  { "<leader>a", "<cmd>Dashboard<cr>", desc = "Dashboard", mode = "n", icon = " " },
  {
    "<leader>f",
    group = "Find",
    icon = " ",
    { "<leader>ff", "<cmd> Telescope find_files <cr>",   desc = "Find files" },
    { "<leader>ft", "<cmd> Telescope live_grep <cr>",    desc = "Find text" },
    { "<leader>fc", "<cmd> Telescope colorscheme <cr>",  desc = "Colorschemes" },
    { "<leader>fs", "<cmd> Telescope git_status <cr>",   desc = "Search changed files" },
    { "<leader>fb", "<cmd> Telescope buffers <cr>",      desc = "Search Buffers" },
    { "<leader>fB", "<cmd> Telescope git_branches <cr>", desc = "Search Branches" },
  },
  {
    "<leader>g",
    group = "Git",
    icon = " ",
    { "<leader>gs", "<cmd>Git<cr>",                                desc = "Git status" },
    { "<leader>ga", "<cmd>Git add .<cr>",                          desc = "Git add" },
    { "<leader>gc", "<cmd>Git commit<cr>",                         desc = "Git commit" },
    { "<leader>gp", "<cmd>Git push<cr>",                           desc = "Git push" },
    { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Git blame toggle" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>",                desc = "Git blame" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",             desc = "Git diff" },
    { "<leader>gl", "<cmd>LazyGit<cr>",                            desc = "LazyGit" },
  },
  {
    "<leader>l",
    group = "LSP",
    icon = "󰈙 ",
    { "<leader>ls", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show diagnostic" },
    { "<leader>la", "<cmd>Lspsaga code_action<cr>",           desc = "Code actions" },
    { "<leader>lm", "<cmd>Mason<cr>",                         desc = "Mason" },
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
    icon = "󰨑 ",
    { "<leader>vs", "<cmd>vsplit<cr>", desc = "Vertical split" },
    { "<leader>vp", "<cmd>split<cr>",  desc = "Horizontal split" },
  },
  {
    "<leader>b",
    group = "Buffer",
    icon = " ",
    { "<leader>bb", "<cmd>bd<cr>",         desc = "Close buffer" },
    { "<leader>bc", "<cmd>%bd|e#|bd#<cr>", desc = "Close other buffers" },
  },
  {
    "<leader>t",
    group = "Transparent",
    icon = " ",
    { "<leader>tt", "<cmd>TransparentToggle<cr>",  desc = "Toggle transparency" },
    { "<leader>tr", "<cmd>TransparentEnable<cr>",  desc = "Enable transparency" },
    { "<leader>td", "<cmd>TransparentDisable<cr>", desc = "Disable transparency" },
  },
  {
    "<leader>z",
    group = "Lazy",
    icon = "󰒲 ",
    { "<leader>zz", "<cmd>Lazy<cr>",        desc = "Lazy" },
    { "<leader>zu", "<cmd>Lazy update<cr>", desc = "Lazy update" },
    { "<leader>zx", "<cmd>Lazy clean<cr>",  desc = "Lazy clear" },
    { "<leader>zs", "<cmd>Lazy sync<cr>",   desc = "Lazy sync" },
  },
  {
    "<leader>r",
    group = "Replace",
    icon = "󰑯 ",
    {
      "<leader>rr",
      function()
        require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })
      end
      ,
      desc = "Search and replace"
    },
  },
  {
    "<leader>q",
    group = "Session",
    icon = " ",
    { "<leader>qs", function() require("persistence").load() end,                desc = "Load" },
    { "<leader>qS", function() require("persistence").select() end,              desc = "Select session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Load last session" },
    { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't save session" },
    { "<leader>qq", "<cmd>qa! <cr>",                                             desc = "Quit Session",      mode = "n" },
  }
}
