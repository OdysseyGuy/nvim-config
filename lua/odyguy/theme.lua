require('rose-pine').setup({
  variant = 'main',
  dark_variant = 'main',
  disable_italics = true,
})

vim.cmd([[ colorscheme rose-pine ]])
vim.cmd([[ sign define DiagnosticSignError text=✘ texthl=DiagnosticSignError linehl= numhl=DiagnosticSignError ]])
vim.cmd([[ sign define DiagnosticSignWarn text=▲ texthl=DiagnosticSignWarn linehl= numhl=DiagnosticSignWarn ]])
vim.cmd([[ sign define DiagnosticSignHint text=⚑ texthl=DiagnosticSignHint linehl= numhl=DiagnosticSignHint ]])
vim.cmd([[ sign define DiagnosticSignInfo text=» texthl=DiagnosticSignInfo linehl= numhl=DiagnosticSignInfo ]])
