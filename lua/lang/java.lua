local M = {}

function M.setup()
  -- (Optional) Prefer ftplugin/java.lua for these
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      vim.bo.expandtab = true
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
    end,
  })

  local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
  local capabilities = ok_cmp and cmp.default_capabilities()
    or vim.lsp.protocol.make_client_capabilities()

  vim.lsp.config("jdtls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("jdtls")
end

return M
