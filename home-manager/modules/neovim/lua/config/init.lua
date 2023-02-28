local M = {}

function M.setup()
  require("config.keymaps")
  require("config.ui")
  require("config.telescope").setup()
  require("config.neogit").setup()
  require("config.whichkey")
end

return M
