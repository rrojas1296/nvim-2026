return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local dashboard = require("dashboard")

		local buttons = {
			{ action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
			{ action = "Telescope live_grep", desc = " Find text", icon = "󰈞 ", key = "t" },
			{ action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
			{ action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
			{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
			{ action = "qa!", desc = " Quit", icon = " ", key = "q" },
		}
		for _, button in ipairs(buttons) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end
		dashboard.setup({
			theme = "doom",
			config = {
				header = {
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"  ██████╗ ██████╗  ██████╗      ██╗ █████╗ ███████╗  ",
					"  ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔══██╗██╔════╝  ",
					"  ██║  ██║██████╔╝██║   ██║     ██║███████║███████╗  ",
					"  ██║  ██║██╔══██╗██║   ██║██   ██║██╔══██║╚════██║  ",
					"  ██████╔╝██║  ██║╚██████╔╝╚█████╔╝██║  ██║███████║  ",
					"  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝  ",
					"",
					"",
					"",
					"",
				},
				center = buttons,
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return {
						"",
						"",
						"",
						"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
					}
				end,
			},
		})
	end,
}
