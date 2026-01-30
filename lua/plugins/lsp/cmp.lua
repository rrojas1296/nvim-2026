return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local vscode_snippets = require("luasnip.loaders.from_vscode")
    local snippets = require("luasnip.loaders.from_lua")
    local ls = require("luasnip")
    local servers = require("config.servers")
    local tailwind_colors = require("tailwindcss-colorizer-cmp")

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vscode_snippets.lazy_load()
    snippets.lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })

    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰇽",
      Variable = "󰂡",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = false,
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            path = "[Path]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            vsnip = "[VSnip]",
            codeium = "[Codeium]",
          })[entry.source.name]
          vim_item = tailwind_colors.formatter(entry, vim_item)
          return vim_item
        end,
      },
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "lazydev" }
      }, {
        { name = "buffer" },
      }),
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config('*', {
      capabilities = capabilities
    })

    for _, server_name in pairs(servers) do
      vim.lsp.config(server_name, {
        capabilities = capabilities,
      })
    end
  end,
}
