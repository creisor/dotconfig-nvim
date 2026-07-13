return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "master",
      build = ":TSUpdate",
      opts = {
        ensure_installed = { "go", "gomod", "gowork", "gotmpl" },
        highlight = { enable = true },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
  },
  build = ":GoInstallDeps",
  opts = {},
  keys = {
    { "<localleader>gsj", "<cmd>GoTagAdd json<cr>", desc = "Add json struct tags" },
    { "<localleader>gsy", "<cmd>GoTagAdd yaml<cr>", desc = "Add yaml struct tags" },
    { "<localleader>gsx", "<cmd>GoTagRm<cr>", desc = "Remove struct tags" },
    { "<localleader>gte", "<cmd>GoTestsExp<cr>", desc = "Generate tests (exported)" },
    { "<localleader>gta", "<cmd>GoTestsAll<cr>", desc = "Generate tests (all)" },
    { "<localleader>gie", "<cmd>GoIfErr<cr>", desc = "Insert if err != nil" },
    { "<localleader>gim", "<cmd>GoImpl<cr>", desc = "Implement interface" },
    { "<localleader>gcm", "<cmd>GoCmt<cr>", desc = "Generate doc comment" },
  },
}
