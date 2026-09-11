local M = {}

-- Checkpoint interval for the periodic save timer.
local SAVE_INTERVAL_MS = 5 * 60 * 1000
-- Written relative to the cwd so it matches the per-pane directory that
-- tmux-resurrect looks in when restoring with `nvim -S Session.vim`.
local SESSION_FILE = "Session.vim"

-- True when at least one real, named file buffer is open. Used to keep the
-- periodic timer from clobbering a good Session.vim with an empty session.
local function has_real_buffer()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf)
      and vim.bo[buf].buflisted
      and vim.bo[buf].buftype == ""
      and vim.api.nvim_buf_get_name(buf) ~= "" then
      return true
    end
  end
  return false
end

function M.save()
  if not has_real_buffer() then
    return
  end
  -- mksession writes relative to the cwd; skip quietly when it isn't writable
  -- (e.g. nvim started in a read-only or otherwise non-writable directory)
  -- so the periodic timer doesn't throw E190 every interval.
  if vim.fn.filewritable(vim.fn.getcwd()) ~= 2 then
    return
  end
  local ok, err = pcall(vim.cmd, "mksession! " .. vim.fn.fnameescape(SESSION_FILE))
  if not ok then
    vim.notify("Session save failed: " .. err, vim.log.levels.WARN)
  end
end

function M.restore()
  if vim.fn.filereadable(SESSION_FILE) == 1 then
    vim.cmd("source " .. vim.fn.fnameescape(SESSION_FILE))
  else
    vim.notify("No " .. SESSION_FILE .. " in " .. vim.fn.getcwd(), vim.log.levels.WARN)
  end
end

function M.setup()
  local timer = (vim.uv or vim.loop).new_timer()
  timer:start(SAVE_INTERVAL_MS, SAVE_INTERVAL_MS, vim.schedule_wrap(M.save))

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = M.save,
  })
end

return M
