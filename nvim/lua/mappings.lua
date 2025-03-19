local map = vim.keymap.set

vim.g.lsp_zero_extend_lspconfig = 0
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
map('n', '<leader>bb', '<Cmd>BufferPick<CR>', opts)
map('n', "<leader>e", "<cmd>Neotree toggle<cr>", opts)
map("n", "<C-n>", ":Neotree filesystem reveal toggle left<CR>", opts)
map("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", opts)
map("n", "<leader>th", ":ToggleTerm size=7 direction=horizontal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)
map("n", "<C-S-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-S-j>", ":resize +2<CR>", opts)
map("n", "<C-S-k>", ":resize -2<CR>", opts)
map("n", "<C-S-l>", ":vertical resize +2<CR>", opts)
map("n", "<Esc>", ":noh<return>")

