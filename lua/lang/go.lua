local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.bo.expandtab = false
      vim.bo.shiftwidth = 0
      vim.bo.tabstop = 4
    end,
  })

  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  lspconfig.gopls.setup({
    capabilities = capabilities,
  })
end

return M
