local M = {}

function M.setup()
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true;
        case_mode = 'smart_case',
      },
    },
  }

  require('telescope').load_extension('fzf')
end

return M