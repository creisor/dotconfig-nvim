return
{
  "twenty9-labs/neotone.nvim",
  config = function()
    require("neotone").setup({
    mode = "system",
    themes = {
      dark = "catppuccin-mocha",
      light = "catppuccin-latte",
        --dark = "ayu",
        -- light = "tempus_totus",
        --light = "zellner"
    },
})
  end
}
