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
      window = {
        border = "single", -- or "rounded", "none", etc.
      },
    })

    local wk = require("which-key")

    wk.register({
      ["<leader>"] = {
        f = {
          name = "+file", -- creates a group under <leader>f
          s = { ":w<CR>", "Save File" },
          f = { ":Telescope find_files<CR>", "Find File" },
        },
        t = {
          name = "+terraform",
          f = { ":!terraform fmt %<CR>", "Format Current File" },
        },
        n = {
          name = "+neotree",
          t = { ":Neotree toggle<CR>", "Toggle Neo-tree" },
        },
      },

      c = {
        name = "ChatGPT",
          c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
          e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
          g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
          t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
          k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
          d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
          a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
          o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
          s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
          f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
          x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
          r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
          l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
        },

    })
  end,
}
