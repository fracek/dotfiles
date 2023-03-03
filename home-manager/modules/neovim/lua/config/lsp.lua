local M = {}

function M.setup()
  local cmp = require('cmp')
  require('cmp').setup {
    sources = {
      { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm {
	select = true,
      },
    },
  }

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- advertise capabilities to lsp servers
  require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities,
  }
  require('lspconfig').tsserver.setup {
    capabilities = capabilities,
  }
  require('lspconfig').pylsp.setup {
    capabilities = capabilities,
  }

  require('lspsaga').setup {
    ui = {
      title = false,
      kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
    },
    symbol_in_winbar = {
      enable = false,
    },
  }

  require('rust-tools').setup {
    tools = {
      reload_workspace_from_cargo_toml = true,
      inlay_hints = {
        auto = true,
      },
    },
  }
end

return M
