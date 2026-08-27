return {
  "FabijanZulj/blame.nvim",
  cmd = "BlameToggle",
  keys = {
    { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle git blame" },
  },
  config = function()
    require('blame').setup {}
  end
}
