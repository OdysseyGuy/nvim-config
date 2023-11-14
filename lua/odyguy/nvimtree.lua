require('nvim-tree').setup({
  git = {
    enable = true,
    ignore = false,
  },
})

require('nvim-tree.view').View.winopts.signcolumn = 'no'

vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<cr>', { silent = true })
