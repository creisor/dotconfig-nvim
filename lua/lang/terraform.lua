local M = {}

function M.setup()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.lsp.config("terraformls", {
    capabilities = capabilities,
    settings = {
      terraform = {
        format = {
          enable = true,
        },
      },
    },
  })
  vim.lsp.enable("terraformls")
end

return M
