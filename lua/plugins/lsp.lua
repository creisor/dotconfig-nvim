return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- 0.11+ flow: no require("lspconfig")
    -- Still fine to use cmp's advertised capabilities:
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- whatever your module does; keep it
    require("lang").setup()

    -- Terraform
    vim.lsp.config("terraformls", {
      -- keep any overrides you relied on; if you omit filetypes/cmd the defaults from lspconfig will be used
      filetypes = { "terraform", "tf" },
      cmd = { "terraform-ls", "serve" },
      capabilities = capabilities,
      -- on_attach = function(client, bufnr) ... end,  -- unchanged if you used it
      -- settings = { ... },
    })
    vim.lsp.enable("terraformls")  -- activates for its filetypes

    -- Python (pyright)
    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })
    vim.lsp.enable("pyright")

    -- Bash
    vim.lsp.config("bashls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("bashls")
  end,
}
