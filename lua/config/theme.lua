-- Terminal-driven light/dark theme switching.
--
-- Neovim (0.10+) queries the terminal for its background color via OSC 11 and
-- sets &background from the response — including over SSH, because the query
-- reaches the outer terminal (Ghostty). We follow &background rather than the
-- OS, so the theme is correct on every host.
--
-- This replaces neotone's "system" mode, which detected the OS with a macOS-only
-- `defaults read -g AppleInterfaceStyle` and therefore left the Linux host stuck
-- in light mode. If the terminal never answers (e.g. tmux doesn't pass OSC 11
-- through), &background stays at Neovim's default of "dark" — a safe fallback.

local M = {}

local themes = {
  dark = "kanagawa-wave",
  light = "tempus_totus",
}

local function apply()
  local scheme = themes[vim.o.background] or themes.dark
  -- pcall so a not-yet-loaded colorscheme never aborts startup.
  pcall(vim.cmd.colorscheme, scheme)
end

-- Ask the terminal for its background color. Neovim consumes the OSC 11 reply
-- and updates &background, which fires the OptionSet autocmd below.
local function requery()
  pcall(function()
    io.stdout:write("\27]11;?\7")
    io.stdout:flush()
  end)
end

function M.setup()
  apply()

  -- Re-apply whenever the detected background changes: async startup detection,
  -- or Ghostty re-reporting after you toggle macOS light/dark.
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = apply,
  })

  -- Manual re-sync after switching appearance. Keeps the historical
  -- :ReloadNeoTone name so existing keymaps (<leader>rf, <leader>ar, …) work.
  vim.api.nvim_create_user_command("ReloadNeoTone", function()
    requery()
    vim.defer_fn(apply, 50)
  end, {})
end

return M
