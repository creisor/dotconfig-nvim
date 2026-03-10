-- Ensure Mason-installed binaries are on PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

vim.keymap.set('n', '<leader>rf', ':ReloadNeoTone<CR>', { noremap = true })
vim.wo.number = true

-- Setup language configurations after lazy.nvim loads
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("lang").setup()
  end,
})

require("config.lazy")
