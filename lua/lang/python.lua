local M = {}

function M.setup()
  -- Editor options
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      vim.bo.expandtab = true
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
    end,
  })

  -- LSP
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  lspconfig.pyright.setup({ capabilities = capabilities })

  -- Formatter (e.g., black via conform/null-ls)
  -- conform handled separately if you use it globally
end

return M
