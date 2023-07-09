local builtin = require("telescope.builtin")
local ui = require("vim.ui")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	vim.ui.input({ prompt = "Search string" }, function(input)
		builtin.grep_string({ search = input })
	end)
end)
vim.keymap.set("n", "<leader>pb", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pt", builtin.treesitter, {})
vim.keymap.set("n", "<leader>pgc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>pgb", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>pgB", builtin.git_branches, {})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"__pycache__",
			".mypy_cache",
			".git",
			".cache",
			".venv",
			".vscode",
			".idea",
			".next",
			".cargo",
		},
	},
})
