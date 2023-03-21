local M = {}

function M.setup()
  local circles = require('circles')

  require('nvim-tree').setup {
    git = {
      enable = false,
    },
    view = {
      side = 'right',
    },
    renderer = {
      icons = {
        glyphs = circles.get_nvimtree_glyphs(),
        show = {
          folder_arrow = false,
        },
      },
    },
  }
end

return M
