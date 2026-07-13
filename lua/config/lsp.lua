-- Shared LSP behavior: keymaps (all servers) + Go format-on-save.
-- nvim 0.11+ already provides defaults: K (hover), grn (rename), gra (code
-- action), grr (references), gri (implementation), gO (document symbols),
-- [d / ]d (diagnostics). The maps below fill the gaps.

local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(args)
      local bufnr = args.buf
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
      map("n", "<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
      map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, "Format buffer")
      map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
    end,
  })
end

-- Format the current Go buffer and organize imports via gopls, synchronously.
-- Called from a BufWritePre autocmd (see lua/lang/go.lua).
function M.go_format_and_organize_imports(bufnr)
  local params = vim.lsp.util.make_range_params(0, "utf-8")
  params.context = { only = { "source.organizeImports" } }

  local results = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
  for cid, res in pairs(results or {}) do
    for _, action in pairs(res.result or {}) do
      if action.edit then
        local client = vim.lsp.get_client_by_id(cid)
        local enc = client and client.offset_encoding or "utf-8"
        vim.lsp.util.apply_workspace_edit(action.edit, enc)
      elseif action.command then
        local client = vim.lsp.get_client_by_id(cid)
        if client then
          client:exec_cmd(action.command, { bufnr = bufnr })
        end
      end
    end
  end

  vim.lsp.buf.format({ bufnr = bufnr, async = false })
end

return M
