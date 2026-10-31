-- Minimal, modular Neovim setup. Requires Neovim 0.11+.
-- Neo-tree replaces the built-in directory browser.
vim.g.loaded_netrw = 1
-- Neo-tree clears this legacy netrw group while taking over directory browsing.
vim.api.nvim_create_augroup("FileExplorer", { clear = false })

require("config.options")
require("config.keymaps")
require("config.lazy")
