return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { "<leader>nt", ":Neotree toggle<CR>", desc = "Toggle Neotree" },
  },
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
    config = function()

    local filesystem_commands = require("neo-tree.sources.filesystem.commands")
    require("neo-tree").setup({
      window = {
        mappings = {
          --["o"] = "open", -- make 'o' behave like <CR>
          ["o"] = function(state) filesystem_commands.open(state) end,
        },
      },
    })
  end,
}
