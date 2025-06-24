local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      vim.bo.expandtab = true
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
    end,
  })

  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  lspconfig.jdtls.setup({
    capabilities = capabilities,
    root_dir = require("lspconfig/util").root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
  })
end

return M
