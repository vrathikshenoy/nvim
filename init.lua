-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Map Ctrl+A to select all text in normal mode
vim.api.nvim_set_keymap("n", "<C-d>", "gg0vG$", { noremap = true, silent = true })
