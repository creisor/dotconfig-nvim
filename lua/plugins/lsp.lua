return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    -- Get enhanced capabilities from nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.terraformls.setup({
      filetypes = { "terraform", "tf" },
      cmd = { "terraform-ls", "serve" },
      capabilities = capabilities,
    })

        -- Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- Bash
    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

  end,
}
