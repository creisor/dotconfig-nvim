return {
  "hashivim/vim-terraform",
  ft = { "terraform", "terraform-vars", "hcl", "tfvars" },
  config = function()
    -- Disable auto-formatting since LSP handles this
    vim.g.terraform_fmt_on_save = 0
    vim.g.terraform_align = 1
    -- Disable other auto-features that might conflict with LSP
    vim.g.terraform_remap_spacebar = 0
    -- Ensure syntax highlighting is enabled
    vim.g.terraform_commentstring = "# %s"
    -- Enable syntax highlighting
    vim.g.terraform_fold_sections = 0
  end,
  -- Ensure the plugin loads for syntax highlighting
  lazy = false,
  -- Load immediately for syntax highlighting
  event = "VeryLazy",
}
