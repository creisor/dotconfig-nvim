return {
  "miikanissi/modus-themes.nvim",
  name = "modus",
  lazy = false,
  priority = 1000,
  config = function()
    require("modus-themes").setup({
      background = {
        dark = "modus_vivendi",
        light = "modus_operandi",
      },
    })
  end,
}
