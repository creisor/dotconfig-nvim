local M = {}

function M.setup()
  require("lang.lua").setup()
  require("lang.python").setup()
  require("lang.bash").setup()
  require("lang.go").setup()
  require("lang.ruby").setup()
  require("lang.java").setup()
end

return M
