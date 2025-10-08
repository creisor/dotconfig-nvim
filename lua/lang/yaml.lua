local M = {}

M.setup = function()
  local ok, _ = pcall(function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "yaml", "yml" },
      callback = function()
        vim.bo.expandtab = true
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
      end
    })
  end)
  if not ok then
    vim.cmd([[
      augroup YAMLIndent
        autocmd!
        autocmd FileType yaml,yml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
      augroup END
    ]])
  end
end

return M
