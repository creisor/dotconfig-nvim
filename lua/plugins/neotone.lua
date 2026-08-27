return
{
  "twenty9-labs/neotone.nvim",
  config = function()
    require("neotone").setup({
    mode = "system",
    themes = {
      dark = "kanagawa-wave",
      light = "tokyonight-day",
        --light = "tempus_totus",
        --light = "catppuccin-latte",
        --dark = "catppuccin-mocha",
        --dark = "ayu",
        --light = "zellner"
    },
})
  end
}
