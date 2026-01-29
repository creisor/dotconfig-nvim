local M = {}

function M.setup()
  -- Terraform language server configuration with formatting
  local config = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- File types this LSP should handle
    filetypes = { "terraform", "terraform-vars", "hcl", "tfvars" },
    -- Single file support
    single_file_support = true,
    -- Enable formatting
    settings = {
      terraform = {
        format = {
          enable = true,
        },
      },
    },
  }

  -- Set up auto-formatting on save for Terraform files
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.tf", "*.tfvars", "*.hcl" },
    callback = function()
      -- Use terraform fmt command
      vim.cmd("silent !terraform fmt -")
    end,
  })

  return config
end

return M