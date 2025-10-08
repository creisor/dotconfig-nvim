local M = {}

function M.setup()
  -- Minimal Terraform language server configuration
  local config = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- File types this LSP should handle
    filetypes = { "terraform", "terraform-vars", "hcl", "tfvars" },
    -- Single file support
    single_file_support = true,
  }

  return config
end

return M