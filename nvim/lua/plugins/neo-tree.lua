return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require('neo-tree')
		neotree.setup({
			window = {
				width = 20,
				mappings = {
					["<space>"] = false,
					["[b"] = "prev_source",
					["]b"] = "next_source",
					["h"] = "navigate_up",
					["l"] = "open",
				},
				fuzzy_finder_mappings = {
					["<C-j>"] = "move_cursor_down",
					["<C-k>"] = "move_cursor_up",
				},
			},
		})
	end,
}
