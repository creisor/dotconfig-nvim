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

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  vim.lsp.config("gopls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("gopls")

  -- Format (gofmt) and organize imports on save.
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("go_format_on_save", { clear = true }),
    pattern = "*.go",
    callback = function(args)
      require("config.lsp").go_format_and_organize_imports(args.buf)
    end,
  })
end

return M
