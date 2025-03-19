return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		 vim.cmd("colorscheme catppuccin-mocha")
		 vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#928374', bold=false })
		 vim.api.nvim_set_hl(0, 'LineNr', { fg='#8ec07c', bold=true })
		 vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#928374', bold=false })
	end
}
