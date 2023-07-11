local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then
  local msg = 'Could not find null-ls. Please install null-ls.'
  vim.notify(msg, vim.log.levels.WARN)
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.stylua,
    formatting.goimports,
    formatting.rustfmt,
    formatting.prettier,
    formatting.black,
    formatting.clang_format,
  },
})
