require('legendary').setup({
  commands = {
    -- Git
    { ':Git', description = 'Open git fugitive window' },
    { ':Git add .', description = 'Add current index' },
    { ':Git commit', description = 'Commit current index' },
    { ':Git push [remote] [branch]', description = 'Push current commit head', unfinished = true },
    { ':Git pull [remote] [branch]', description = 'Pull from remote branch', unfinished = true },
    { ':Git fetch', description = 'Fetch from remote branch' },
    { ':Git merge', description = 'Merge current branch' },
    { ':Git checkout', description = 'Checkout current branch' },
    { ':Git checkout -b [branch]', description = 'Create new branch', unfinished = true },
    { ':Git branch', description = 'List branches' },
    { ':Git log', description = 'Git log' },
    { ':Git log --oneline', description = 'Git log oneline' },
    { ':Git log --graph', description = 'Git log graph' },
    { ':Git status', description = 'Git status' },
    { ':Git diff', description = 'Git diff' },
    { ':Git rm', description = 'Git rm' },
    { ':Git rm --cached', description = 'Git rm --cached' },
    { ':Git reset', description = 'Git reset' },
    { ':Git blame', description = 'Git blame' },
    { ':Git show', description = 'Git show' },
    { ':Git grep', description = 'Git grep' },
    { ':Git grep -n', description = 'Git grep for current word' },

    -- LSP
    { ':LspStop', description = 'Stop lsp server' },
    { ':LspRestart', description = 'Restart lsp server' },
    { ':LspStart', description = 'Start lsp server' },
    { ':LspStopAll', description = 'Stop all lsp server' },
    { ':LspStartAll', description = 'Start all lsp server' },
    { ':LspInfo', description = 'Lsp info' },
    { ':LspInstall', description = 'Lsp install' },
    { ':LspUninstall', description = 'Lsp uninstall' },
    { ':LspUpdate', description = 'Lsp update' },
    { ':LspStatus', description = 'Lsp status' },
    { ':LspLog', description = 'Lsp log' },

    -- DAP
    { ':DapContinue', description = 'Continue' },
    { ':DapToggleBreakpoint', description = 'Toggle breakpoint' },
    { ':DapNext', description = 'Next' },
    { ':DapStepOver', description = 'Step over' },
    { ':DapStepInto', description = 'Step into' },
    { ':DapStepOut', description = 'Step out' },
    { ':DapTerminate', description = 'Terminate' },
    { ':DapToggleRepl', description = 'Toggle repl' },
    { ':DapToggleConsole', description = 'Toggle console' },
    { ':DapAttach', description = 'Attach' },

    -- Mason
    { ':Mason', description = 'Mason' },
    { ':MasonInstall [module]', description = 'Mason install', unfinished = true },
    { ':MasonUninstall [module]', description = 'Mason uninstall', unifinished = true },
    { ':MasonUpdate', description = 'Mason update' },
    { ':MasonStatus', description = 'Mason status' },

    -- NvimTree
    { ':NvimTreeToggle', description = 'Toggle nvim tree' },
    { ':NvimTreeRefresh', description = 'Refresh nvim tree' },
    { ':NvimTreeFocus', description = 'Focus nvim tree' },
    { ':NvimTreeOpen', description = 'Open nvim tree' },
    { ':NvimTreeClose', description = 'Close nvim tree' },
    { ':NvimTreeResize', description = 'Resize nvim tree' },
    { ':NvimTreeCollapse', description = 'Collapse nvim tree' },

    -- Telescope
    { ':Telescope', description = 'Telescope' },
    { ':Telescope live_grep', description = 'Telescope live_grep' },
    { ':Telescope find_files', description = 'Telescope find_files' },
    { ':Telescope buffers', description = 'Telescope buffers' },
    { ':Telescope help_tags', description = 'Telescope help_tags' },
    { ':Telescope oldfiles', description = 'Telescope oldfiles' },
    { ':Telescope keymaps', description = 'Telescope keymaps' },
    { ':Telescope diagnostics', description = 'Telescope diagnostics' },
    { ':Telescope colorscheme', description = 'Telescope colorscheme' },
    { ':Telescope grep_string', description = 'Telescope grep_string' },
    { ':Telescope git_files', description = 'Telescope git_files' },
    { ':Telescope git_bcommits', description = 'Telescope git_bcommits' },
    { ':Telescope git_commits', description = 'Telescope git_commits' },
    { ':Telescope git_branches', description = 'Telescope git_branches' },
    { ':Telescope git_stash', description = 'Telescope git_stash' },
    { ':Telescope git_status', description = 'Telescope git_status' },

    -- Treesitter
    { ':TSInstall [module]', description = 'Install treesitter module', unfinished = true },
    { ':TSUpdate', description = 'Update treesitter' },
    { ':TSToggle', description = 'Toggle treesitter' },
    { ':TSEnable', description = 'Enable treesitter' },
    { ':TSDisable', description = 'Disable treesitter' },
    { ':TSSetup', description = 'Setup treesitter' },

    -- Packer
    { ':PackerSync', description = 'Sync packer' },
    { ':PackerUpdate', description = 'Update packer' },
    { ':PackerClean', description = 'Clean packer' },
    { ':PackerCompile', description = 'Compile packer' },
    { ':PackerInstall', description = 'Install packer' },
    { ':PackerStatus', description = 'Packer status' },
  },
  select_prompt = 'Commands Palette',
  extensions = {
    nvim_tree = true,
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>lg', '<cmd>Legendary<cr>', { silent = true })
