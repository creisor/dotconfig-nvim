return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      background = {
        dark = "wave",
        light = "lotus",
      },
    })
  end,
}
