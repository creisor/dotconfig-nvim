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

    wk.add({
      { "<leader>a", group = "neotone" },
      { "<leader>ar", "<cmd>ReloadNeoTone<CR>", desc = "Reload neotone (after switching dark/light mode, e.g.)" },

      { "<leader>b", group = "buffers" },
      { "<leader>be", "<cmd>Telescope buffers<CR>", desc = "Buffer List" },
      { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
      { "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
      { "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer" },


      { "<leader>f", group = "file" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fs", "<cmd>w<CR>", desc = "Save File" },

      { "<leader>n", group = "neotree" },
      { "<leader>nt", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },

      { "<leader>t", group = "terraform" },
      { "<leader>tf", "<cmd>!terraform fmt %<CR>", desc = "Format Current File" },
      { "<leader>tfa", "<cmd>!terraform fmt .<CR>", desc = "Format All Files" },

      { "<leader>d", vim.diagnostic.open_float, desc = "Show Diagnostic" },

      { "<leader>c", group = "ChatGPT" },
      { "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      {
        mode = { "n", "v" },
        { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
        { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
        { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
        { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
        { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
        { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
        { "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
        { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
        { "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
        { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
        { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
        { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
      },
    })
  end,
}
