local M = {}

function M.setup()
  require("lang.bash").setup()
  require("lang.go").setup()
  require("lang.java").setup()
  require("lang.lua").setup()
  require("lang.python").setup()
  require("lang.ruby").setup()
  require("lang.terraform").setup()
  require("lang.typescript").setup()
  require("lang.yaml").setup()
  require("lang.json").setup()
end

return M
