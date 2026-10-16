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
  dark = "modus_vivendi",
  light = "modus_operandi",
}

local function apply()
  local scheme = themes[vim.o.background] or themes.dark
  -- Applied synchronously: changing &background makes Neovim re-source the current
  -- colorscheme first (kanagawa's colors_name is the ambiguous "kanagawa", which
  -- re-selects lotus on a light background); the OptionSet handler runs after
  -- that, so setting our explicit choice here wins immediately — no next-tick lag.
  -- pcall so a not-yet-loaded colorscheme never aborts startup.
  pcall(vim.cmd.colorscheme, scheme)
end

-- Blend a 24-bit color toward `target` by `amt` (0..1).
local function blend(rgb, target, amt)
  local function ch(c, div) return math.floor(c / div) % 256 end
  local r, g, b = ch(rgb, 65536), ch(rgb, 256), rgb % 256
  local tr, tg, tb = ch(target, 65536), ch(target, 256), target % 256
  r = math.floor(r + (tr - r) * amt)
  g = math.floor(g + (tg - g) * amt)
  b = math.floor(b + (tb - b) * amt)
  return r * 65536 + g * 256 + b
end

-- The indent guides (indent-blankline's IblIndent/IblScope) read as distractingly
-- dark lines — most obviously on the light theme (dark lines on white). Make them
-- low-contrast by nudging the editor background a little toward its opposite: a
-- barely-there guide, with the active scope slightly more visible. Recomputed per
-- theme so it tracks the live background.
local function style_indent()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local bg = normal.bg or 0x000000
  local target = (vim.o.background == "dark") and 0xffffff or 0x000000
  vim.api.nvim_set_hl(0, "IblIndent", { fg = blend(bg, target, 0.11), nocombine = true })
  vim.api.nvim_set_hl(0, "IblScope", { fg = blend(bg, target, 0.28), nocombine = true })
end

-- Neo-tree paints its own window background: modus sets NeoTreeNormal/NormalNC to
-- the bg_active/bg_inactive grays, so the sidebar reads gray rather than the
-- editor background. Link those back to Normal (and the end-of-buffer tildes to
-- the editor's EndOfBuffer) so the tree matches the theme background. Theme-
-- agnostic on purpose — it tracks whatever colorscheme is live.
local function style_neotree()
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { link = "EndOfBuffer" })
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
  -- Re-apply the custom highlight overrides on every colorscheme load (a
  -- colorscheme resets all highlights), including the initial apply() below.
  vim.api.nvim_create_autocmd("ColorScheme", { callback = style_indent })
  vim.api.nvim_create_autocmd("ColorScheme", { callback = style_neotree })

  apply()
  style_indent()
  style_neotree()

  -- Re-apply whenever the detected background changes: async startup detection,
  -- or Ghostty re-reporting after you toggle macOS light/dark.
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = apply,
  })

  -- Re-query the terminal background whenever nvim regains focus, so returning to
  -- the editor after toggling the Mac's appearance re-detects light/dark without a
  -- manual command. Requires tmux `focus-events on` to fire over SSH. Caveat: tmux
  -- caches the outer terminal's background at client attach, so a live toggle only
  -- surfaces after the tmux client re-attaches (detach + `tmux a`); until then this
  -- re-reads the same cached value — harmless, just a no-op.
  vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
      requery()
      vim.defer_fn(apply, 50)
    end,
  })

  -- Manual re-sync after switching appearance. Keeps the historical
  -- :ReloadNeoTone name so existing keymaps (<leader>rf, <leader>ar, …) work.
  vim.api.nvim_create_user_command("ReloadNeoTone", function()
    requery()
    vim.defer_fn(apply, 50)
  end, {})
end

return M
