-- lspsaga keymaps
-- code finder
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", { silent = true })

-- outline
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>", { silent = true })

-- definition
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { silent = true })
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<cr>", { silent = true })

-- code action
vim.keymap.set("n", "<leader>vca", "<cmd>Lspsaga code_action<cr>", { silent = true })

-- rename all occurances of the hovered word
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true })

-- diagnostics
vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", { silent = true })

-- call hierarchy
vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", { silent = true })
vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", { silent = true })

-- floating terminal
vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

-- hover
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true })
