return {
  "ayu-theme/ayu-vim",
  name = "ayu",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    vim.g.ayu_theme = "dark"
  end,
}
