return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "terraformls",     -- Re-enabled now that ALE is fixed
        "pyright",         -- Python
        "bashls",          -- Bash
        "lua_ls",          -- Lua
        "gopls",           -- Go
        "jdtls",           -- Java
        "solargraph",      -- Ruby
        "ts_ls",           -- TypeScript / JavaScript
      },
      -- Disable automatic LSP setup since we use built-in LSP
      automatic_installation = false,
      handlers = {}, -- Disable all handlers
    })
  end,
}
