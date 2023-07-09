local bufferline = require("bufferline")

bufferline.setup({
	options = {
		style_preset = bufferline.style_preset.no_italic,
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
	},
})

vim.keymap.set("n", "<leader>bh", "<cmd>bprev<cr>", { silent = true })
vim.keymap.set("n", "<leader>bl", "<cmd>bnext<cr>", { silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { silent = true })
