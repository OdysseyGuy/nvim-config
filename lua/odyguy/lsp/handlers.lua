local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    local msg = "Could not find cmp_nvim_lsp. Please install cmp_nvim_lsp."
    vim.notify(msg, vim.log.levels.WARN)
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "✘" },
        { name = "DiagnosticSignWarn",  text = "▲" },
        { name = "DiagnosticSignHint",  text = "⚑" },
        { name = "DiagnosticSignInfo",  text = "»" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
    }

    vim.diagnostic.config(config)

    -- rounded border for :LspInfo window
    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local lsp_keymaps = function(bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "gI", function()
        vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "gr", function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "gl", function()
        vim.lsp.buf.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("n", "<leader>lq", function()
        vim.lsp.buf.setloclist()
    end, opts)
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)

    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    if client.supports_method("textDocument/formatting") and client then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

function M.enable_format_on_save()
    vim.cmd([[
    augroup format_on_save
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({async = false})
    augroup end
    ]])
    vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
    M.remove_augroup("format_on_save")
    vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
    if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

M.toggle_format_on_save()

return M
