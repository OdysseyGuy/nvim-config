local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  local msg = 'Could not find mason. Please install mason.'
  vim.notify(msg, vim.log.levels.WARN)
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  local msg = 'Could not find mason-lspconfig. Please install mason-lspconfig.'
  vim.notify(msg, vim.log.levels.WARN)
  return
end

local settings = {
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
  log_level = vim.log.levels.INFO,
}

mason.setup(settings)

-- servers that needs to be pre-installed
local ensure_installed = {
  'lua_ls',
}

mason_lspconfig.setup({
  ensure_installed = ensure_installed,
})

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  local msg = 'Could not find lspconfig. Please install lspconfig.'
  vim.notify(msg, vim.log.levels.WARN)
  return
end

-- handler stuff
local on_attach = require('odyguy.lsp.handlers').on_attach
local capabilities = require('odyguy.lsp.handlers').capabilities

local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
clangd_capabilities.textDocument.completion.completionItem.snippetSupport = true
clangd_capabilities.offsetEncoding = 'utf-8'

-- server setup
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    lspconfig[server_name].setup(opts)
  end,

  -- gopls
  ['gopls'] = function()
    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            unusedwrite = true,
            unusedvariable = true,
          },
        },
      },
    })
  end,
  ['clangd'] = function()
    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = clangd_capabilities,
    })
  end,
})
