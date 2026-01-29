return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		window = {
			mappings = {
				["l"] = "open",
				["I"] = "toggle_hidden",
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
			},
		},
	},
}
