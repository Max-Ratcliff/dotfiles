-- ~/.config/nvim/lua/mwratcliff/plugins/dashboard-nvim.lua

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Corrected dependency format
		config = function()
			require("dashboard").setup({
				theme = "hyper", -- You're using the hyper theme

				-- Configuration options should be direct children here:
				shortcut = {
					-- Example of a correctly defined shortcut:
					{
						desc = "󰚰 New File", -- An actual string description
						group = "@property", -- A valid highlight group (or a default like '@property')
						key = "n", -- The actual key to press
						action = "enew", -- The command to execute
					},
					{
						desc = " Recent Files",
						group = "@property",
						key = "r",
						action = "Telescope oldfiles",
					},
					-- Add more shortcuts here as needed, following the example above
					-- Remove or complete the placeholder entry you had.
				},

				packages = { enable = true }, -- show how many plugins neovim loaded

				project = {
					enable = true,
					limit = 8,
					icon = " ", -- Example icon (requires a Nerd Font) or remove/change
					label = "Projects: ", -- Optional label
					action = "Telescope find_files cwd=", -- Action when selecting a project
				},

				mru = { -- Most Recently Used files
					enable = true,
					limit = 10,
					icon = " ", -- Example icon or remove/change
					label = "Recent: ", -- Optional label
					cwd_only = false,
				},

				footer = {
					-- Example footer:
					-- "Neovim is fun!",
					-- string.format("Uptime: %s", vim.fn.execute('uptime -p')),
				},
				-- For more configuration options, refer to the dashboard-nvim documentation:
				-- https://github.com/nvimdev/dashboard-nvim
			})
		end,
	},
}
