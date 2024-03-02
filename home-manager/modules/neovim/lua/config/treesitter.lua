local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'c', 'lua', 'vim', 'help', 'query', -- required by treesitter
      'rust', 'markdown', 'markdown_inline', -- rust
      'typescript', 'javascript', 'python', -- good to have
      'bash', 'json', 'yaml' -- also good to have
    },
    ignore_install = { 'help' },
    auto_install = true,
    highlight = {
      enable = true,
    },
  }
end

return M
