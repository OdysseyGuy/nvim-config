vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- dashboard
    use({
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                hide = {
                    statusline = true,
                    tabline = true,
                    winbar = true,
                },
            })
        end,
        requires = { "nvim-tree/nvim-web-devicons" },
    })

    -- telescope fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use("nvim-tree/nvim-tree.lua")
    use({
        "folke/trouble.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" })

    -- lsp support
    use("neovim/nvim-lspconfig")

    -- mason installer
    use("williamboman/mason.nvim", { run = ":MasonUpdate" })
    use("williamboman/mason-lspconfig.nvim")

    -- null-ls for formatting and diagnostics
    use("jose-elias-alvarez/null-ls.nvim")

    -- nvimcmp for autocompletion menu
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")

    -- snippet support
    use("L3MON4D3/LuaSnip")

    -- lspsaga
    use({
        "nvimdev/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function()
            require("lspsaga").setup({
                ui = {},
                symbol_in_winbar = {
                    separator = " ",
                },
            })
        end,
        requires = {
            { "nvim-tree/nvim-web-devicons" },
        },
    })

    -- nvim-dap
    use("mfussenegger/nvim-dap")
    -- nvim-dap-ui
    use("rcarriga/nvim-dap-ui")
    -- nvim-dap-virtual-text
    use("theHamsta/nvim-dap-virtual-text")

    -- Rose-pine theme
    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })

    -- codeium
    use({
        "Exafunction/codeium.vim",
        config = function()
            vim.keymap.set("i", "<C-y>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true })
            vim.keymap.set("i", "<C-x>", function()
                return vim.fn["codeium#Clear"]()
            end, { expr = true })
        end,
    })

    -- nvim notify
    use("rcarriga/nvim-notify")

    -- hop
    use({
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup()
        end,
    })

    -- mini comment
    use("echasnovski/mini.comment")
    -- mini autopairs
    use("echasnovski/mini.pairs")
    -- mini surround
    use("echasnovski/mini.surround")
    -- mini move
    use("echasnovski/mini.move")

    -- nvim scrollbar
    use("petertriho/nvim-scrollbar")

    -- legendary
    use({
        "mrjones2014/legendary.nvim",
        tag = "v2.1.0",
    })

    -- nvim dressing
    use("stevearc/dressing.nvim")
end)
