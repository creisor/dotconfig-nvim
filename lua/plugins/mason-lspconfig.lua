return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "terraformls",
        "pyright",         -- Python
        "bashls",          -- Bash
      },
    })
  end,
}
