local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- cd ~/.local/share/nvim\nrm -r *\n# check your XDG_* env vars for this\ncd ~/.cache/nvim\nrm -r *
require("options")
require("mappings")
require("lazy").setup("plugins")

local cpp_runner = require("cpp_runner")
vim.api.nvim_set_keymap("n", "<C-b>", ":lua require('cpp_runner').compile_and_run_cpp()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })

