local M = {}

function M.setup()
  vim.cmd.colorscheme "catppuccin-mocha"

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- transparent background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
