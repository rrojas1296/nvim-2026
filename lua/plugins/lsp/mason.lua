return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"emmet_ls",
			"prismals",
			"lua_ls",
			"eslint",
			"pyright",
			"graphql",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup(opts)

		local severity = vim.diagnostic.severity

		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = " ",
					[severity.WARN] = " ",
					[severity.HINT] = "󰠠 ",
					[severity.INFO] = " ",
				},
			},
		})
	end,
}
