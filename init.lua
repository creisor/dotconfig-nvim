vim.keymap.set('n', '<leader>nt', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rf', ':ReloadNeoTone<CR>', { noremap = true })
vim.wo.number = true
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic message" })


require("config.lazy")
