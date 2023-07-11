require('nvim-tree').setup({
  git = {
    enable = true,
    ignore = false,
  },
})

require('nvim-tree.view').View.winopts.signcolumn = 'no'
