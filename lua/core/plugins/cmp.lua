return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		{
			"folke/lazydev.nvim",
			ft = "lua",
		},
		{
			"Exafunction/windsurf.nvim",
			config = function()
				local codeium = require("codeium")
				codeium.setup({
					virtual_text = {
						enabled = true,
					},
				})
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local vscode_snippets = require("luasnip.loaders.from_vscode")

		vscode_snippets.lazy_load()

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
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				expandable_indicator = false,
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
					-- Source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
						vsnip = "[VSnip]",
						codeium = "[Codeium]",
					})[entry.source.name]
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
				{ name = "vsnip" },
				{ name = "luasnip" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
