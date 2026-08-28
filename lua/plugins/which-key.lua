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

      { "<leader>c", group = "code refs n defs" },
      { "<leader>cr", "<cmd>Telescope lsp_references<CR>", desc = "LSP references" },
      { "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", desc = "LSP definitions" },

      { "<leader>f", group = "file" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fs", "<cmd>w<CR>", desc = "Save File" },

      { "<leader>g", group = "git" },
      { "<leader>gb", "<cmd>BlameToggle<CR>", desc = "Toggle git blame" },
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview: Open" },
      { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Diffview: Close" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview: Repo History" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: Current File History" },

      { "<leader>n", group = "neotree" },
      { "<leader>nt", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },

      { "<leader>s", group = "session" },
      { "<leader>ss", function() require("config.session").save() end, desc = "Save session" },
      { "<leader>sr", function() require("config.session").restore() end, desc = "Restore session" },

      { "<leader>t", group = "terraform" },
      { "<leader>tf", "<cmd>!terraform fmt %<CR>", desc = "Format Current File" },
      { "<leader>tfa", "<cmd>!terraform fmt .<CR>", desc = "Format All Files" },

      { "<leader>d", vim.diagnostic.open_float, desc = "Show Diagnostic" },
      
    })
  end,
}
