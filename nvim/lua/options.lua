vim.opt.undofile = true
vim.opt.hlsearch = true

vim.cmd("set clipboard=unnamedplus")
vim.cmd("set cmdheight=1")
vim.cmd("set number relativenumber")
vim.cmd("set cmdheight=0")
vim.cmd("set nuw=1")
vim.cmd("set nowrap")
vim.cmd("set smartcase ignorecase")
vim.cmd("set tabstop=2 softtabstop=2 shiftwidth=2")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.lua", "*.py", "*.rs" },
	group = 'AutoFormatting',
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})
