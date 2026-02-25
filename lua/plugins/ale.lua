return {
  'dense-analysis/ale',
  config = function()
    -- Configuration goes here.
    local g = vim.g

    g.ale_ruby_rubocop_auto_correct_all = 1

    -- Use only non-LSP linters to avoid conflicts with Neovim's built-in LSP
    g.ale_linters = {
      ruby = {'rubocop', 'ruby'},
      lua = {'luacheck'},           -- Use luacheck instead of lua_language_server
      python = {'ruff'},            -- Use ruff instead of flake8/pyright
      go = {'go', 'govet', 'errcheck'},
      terraform = {'terraform_validate', 'tflint'},
      javascript = {'eslint'},
      javascriptreact = {'eslint'},
      typescript = {'eslint'},
      typescriptreact = {'eslint'},
    }
    
    -- Configure ruff to respect project configuration files
    g.ale_python_ruff_options = '--config pyproject.toml'
    
    -- Make sure ALE uses ruff for Python files
    g.ale_python_ruff_executable = 'ruff'
    
    -- Additional ruff configuration
    g.ale_python_ruff_use_global = 0  -- Use local ruff if available
    g.ale_python_ruff_change_directory = 1  -- Change to project root for config discovery
    
    -- Disable ALE for file types where we use LSP
    g.ale_filetype_blacklist = {
      -- Let LSP handle these file types
      'terraform',
      'hcl', 
      'tfvars',
    }
  end
}
