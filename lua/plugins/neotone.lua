return
{
  "twenty9-labs/neotone.nvim",
  config = function()
    require("neotone").setup({
    mode = "system",
    themes = {
        dark = "ayu",
        light = "tempus_totus",
    },
})
  end
}
