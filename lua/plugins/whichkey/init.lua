return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local whichKey = require("which-key")
		local mappings = require("plugins.whichkey.mappings")
		whichKey.setup({
			triggers = {
				{
					"<leader>",
					mode = { "n", "v" },
				},
			},
			preset = "helix",
		})
		whichKey.add(mappings)
	end,
}
