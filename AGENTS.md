# AGENTS.md

- Build/Lint/Test Commands
  - **Single Test**: run a focused test with headless Neovim; adapt to framework.
    - `nvim --headless -u NONE -c "lua dofile('tests/foo_test.lua')" -c "qa"`
    - `nvim --headless -u NONE -c "lua require('plenary').test_harness.run('tests/foo_test.lua')" -c "qa"`
- **All Tests**: `nvim --headless -u NONE -c "lua require('plenary').tests.run_all()" -c "qa"`
  - **Lint/Format**: `stylua lua/ config/` and `luacheck lua/ config/` (if installed)
  - **Note**: prefer a single-test run first to verify env.

- Code Style Guidelines
  - **Imports**: use local requires; place at top; avoid globals.
  - **Formatting**: two-space indent; newline at end; no trailing spaces.
  - **Types**: Lua is dynamic; add EmmyLua-style annotations for public APIs.
  - **Naming**: modules in snake_case; locals in snake_case; exported APIs as module table.
  - **Error Handling**: favor nil, error returns; use vim.notify for user-facing errors.
  - **Testing**: tests isolated; mock I/O; deterministic seeds where applicable.
- Cursor and Copilot Rules: Cursor: none detected; Copilot: none detected