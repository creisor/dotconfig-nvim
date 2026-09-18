-- Ensure Mason-installed binaries are on PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

vim.keymap.set('n', '<leader>rf', ':ReloadNeoTone<CR>', { noremap = true })
vim.wo.number = true

-- Shared LSP keymaps (applies to all servers via LspAttach)
require("config.lsp").setup()

-- Periodic Session.vim checkpointing (integrates with tmux-resurrect)
require("config.session").setup()

-- Setup language configurations after lazy.nvim loads
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("lang").setup()
  end,
})

require("config.lazy")

-- Follow the terminal background (OSC 11) for light/dark theme selection.
-- Runs after lazy so the colorscheme plugins are loaded.
require("config.theme").setup()
