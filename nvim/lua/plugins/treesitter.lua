return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = false,
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"cpp",
					"rust",
					"python",
					"css",
					"scss",
					"html",
					"javascript",
					"typescript",
					"json"
				},

				highlight = { enable = true },
				indent = { enable = false },
			})
		end
	}
}
