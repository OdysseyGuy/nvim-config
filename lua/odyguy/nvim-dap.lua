local dap = require('dap')

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.exepath('OpenDebugAD7'),
}

dap.adapters.dart = {
  type = 'executable',
  command = vim.fn.exepath('dart-debug-adapter'),
  args = { 'flutter' },
}

dap.adapters.jsdebug = {
  type = 'executable',
  command = vim.fn.exepath('js-debug-adapter'),
}

dap.adapters.debugpy = {
  type = 'executable',
  command = vim.fn.exepath('debugpy-adapter'),
}

dap.adapters.chrome = {
  type = 'executable',
  command = vim.fn.exepath('chrome-debug-adapter'),
}

dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.exepath('netcoredbg'),
  args = { '--interpreter=vscode' },
}

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.exepath('codelldb'),
    args = { '--port', '${port}' },
  },
}

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.exepath('dlv'),
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

dap.adapters.goadapter = {
  type = 'server',
}

-- windows specific options
if vim.fn.has('win32') == 1 then
  dap.adapters.cppdbg.options = {
    detached = false,
  }
  dap.adapters.codelldb.executable.detached = false
end

-- configurations for c debugging with cppdbg
dap.configurations.c = {
  {
    name = 'Launch file',
    type = 'cppdbg', -- must match the adapter
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'Enable pretty-printing for gdb',
        ignoreFailures = true,
      },
    },
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'Enable pretty-printing for gdb',
        ignoreFailures = true,
      },
    },
  },
}

-- use the same configuration for rust and c++
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

dap.configurations.python = {
  {
    name = 'Launch file',
    type = 'debugpy',
    request = 'launch',
    program = '${file}',
    pythonPath = function()
      return '/usr/bin/python3'
    end,
  },
  {
    name = 'Launch file with arguments',
    type = 'debugpy',
    request = 'launch',
    program = '${file}',
    args = function() end,
    pythonPath = function()
      return '/usr/bin/python3'
    end,
  },
  {
    name = 'Run doctest in file',
    type = 'debugpy',
    request = 'launch',
    module = 'doctest',
    args = { '${file}' },
    noDebug = true,
    pythonPath = function()
      return '/usr/bin/python3'
    end,
  },
}

dap.configurations.go = {
  {
    name = 'Launch file (delve)',
    type = 'delve',
    request = 'launch',
  },
  {
    name = 'Launch file (go-adapter)',
    type = 'goadapter',
    request = 'launch',
  },
}

vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = '', linehl = '', numhl = '' })

-- dap ui
local dapui = require('dapui')
dapui.setup()

-- dap virtual text
require('nvim-dap-virtual-text').setup({
  enabled = true,
  highlight_new_as_changed = true,
  only_first_definition = false,
  show_stop_reason = true,
  virt_text_pos = vim.fn.has('nvim-0.10') == 1 and 'inline' or 'eol',
})

local dap_ui_widgets = require('dap.ui.widgets')

-- nvim-dap keymappings
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { silent = true })
vim.keymap.set('n', '<leader>dB', function()
  local cond = vim.ui.input({ prompt = 'Breakpoint condition' }, function(input)
    dap.set_breakpoint(input)
  end)
end, { silent = true })
vim.keymap.set('n', '<leader>ds', dap.close, { silent = true })
vim.keymap.set('n', '<leader>dc', dap.continue, { silent = true })
vim.keymap.set('n', '<leader>dk', dap.up, { silent = true })
vim.keymap.set('n', '<leader>dj', dap.down, { silent = true })
vim.keymap.set('n', '<leader>dn', dap.run_to_cursor, { silent = true })
vim.keymap.set('n', '<leader>d_', dap.run_last, { silent = true })
vim.keymap.set('n', '<leader>di', dap_ui_widgets.hover, { silent = true })
vim.keymap.set('n', '<leader>dS', function()
  dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
end, { silent = true })

-- dapui keymappings
vim.keymap.set('n', '<leader>duo', dapui.open, { silent = true })
vim.keymap.set('n', '<leader>duc', dapui.close, { silent = true })
vim.keymap.set('n', '<leader>dui', dapui.toggle, { silent = true })

-- telescope-dap
vim.keymap.set('n', '<leader>pdc', function()
  require('telescope').extensions.dap.commands()
end)
vim.keymap.set('n', '<leader>pdg', function()
  require('telescope').extensions.dap.configurations()
end)
vim.keymap.set('n', '<leader>pdv', function()
  require('telescope').extensions.dap.variables()
end)
vim.keymap.set('n', '<leader>pdb', function()
  require('telescope').extensions.dap.list_breakpoints()
end)
vim.keymap.set('n', '<leader>pdf', function()
  require('telescope').extensions.dap.frames()
end)
