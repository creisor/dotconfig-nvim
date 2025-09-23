return {
  "folke/which-key.nvim",
  event = "VeryLazy",  -- load after startup
  config = function()
    require("which-key").setup({
      -- You can customize timeout, window border, layout, etc. here
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      win= {
        border = "single", -- or "rounded", "none", etc.
      },
    })

    local wk = require("which-key")

    -- wk.register({
    --   ["<leader>b"] = {
    --     name = "+buffers",
    --     e = { "<cmd>Telescope buffers<CR>", "buffer list" },
    --   },
    -- })
    --
    -- vim.keymap.set("n", "<leader>be", "<cmd>Telescope buffers<CR>", { desc = "buffer list" })
    --
    -- wk.register({
    --   ["<leader>b"] = { name = "+buffers" },
    -- })

    wk.add({
      { "<leader>f", group = "file" }, -- group
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
      { "<leader>fs", ":w<CR>", desc = "Save File" },
      { "<leader>n", group = "neotree" },
      { "<leader>nt", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
      { "<leader>t", group = "terraform" },
      { "<leader>tf", ":!terraform fmt %<CR>", desc = "Format Current File" },
      { "c", group = "ChatGPT" },
      { "cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      {
        mode = { "n", "v" },
        { "ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
        { "cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
        { "ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
        { "cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
        { "cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
        { "ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
        { "cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
        { "co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
        { "cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
        { "cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
        { "ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
        { "cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
      },
    })
  end,
}
