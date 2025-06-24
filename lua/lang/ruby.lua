local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "ruby",
    callback = function()
      vim.bo.expandtab = true
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
    end,
  })

  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  lspconfig.solargraph.setup({
    capabilities = capabilities,
  })
end

return M
