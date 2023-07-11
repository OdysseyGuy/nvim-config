local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  cond = hide_in_width,
}

local spaces = function()
  return 'Spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local line_ending = function()
  local fileformat = vim.api.nvim_buf_get_option(0, 'fileformat')
  if fileformat == 'unix' then
    return 'LF'
  end
  if fileformat == 'dos' then
    return 'CRLF'
  end
  if fileformat == 'mac' then
    return 'CR'
  end
end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', diff, 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { spaces, line_ending, 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
  },
})
