vim.keymap.set('n', '<leader>nt', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rf', ':ReloadNeoTone<CR>', { noremap = true })
vim.wo.number = true
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

-- Setup language configurations after lazy.nvim loads
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("lang").setup()
  end,
})

require("config.lazy")
