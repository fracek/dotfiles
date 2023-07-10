local M = {}

function M.setup()
  local cmp = require('cmp')
  require('cmp').setup {
    sources = {
      { name = 'nvim_lsp' },
    },
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
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
  local lspconfig = require('lspconfig')
  lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
  }
  lspconfig.tsserver.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = false,
  }
  lspconfig.denols.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  }
  lspconfig.pylsp.setup {
    capabilities = capabilities,
  }
  lspconfig.gopls.setup {
    capabilities = capabilities,
  }

  require('lspsaga').setup {
    ui = {
      title = false,
      devicon = false,
    },
    lightbulb = {
      enabled = true,
      sign = false,
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
