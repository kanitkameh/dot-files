local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "gd",  vim.lsp.buf.definition, { desc = "Definition"})
map("n", "gD",  vim.lsp.buf.type_definition, { desc = "Type definition"})
map("n", "K",  vim.lsp.buf.hover, { desc = "Hover"})
map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation"})
map("n", "gr", vim.lsp.buf.references, { desc = "References"})
map("n", "gds", vim.lsp.buf.document_symbol, { desc = "Document symbol"})
map("n", "gws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol"})
map("n", "<leader>cl", vim.lsp.codelens.run, { desc = "Code lens"})
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature help"})
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename"})
map("n", "gci",  vim.lsp.buf.incoming_calls, { desc = "Incoming Calls"})
map("n", "gco",  vim.lsp.buf.outgoing_calls, { desc = "Outgoing Calls"})
map("n", "<leader>f", vim.lsp.buf.format, { desc = "Format"})
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action"})

map("n", "<leader>ws", function()
    require("metals").hover_worksheet()
end, { desc = "Hover worksheet"})

map("n", "<leader>aa", vim.diagnostic.setqflist, { desc = "Workdspace diagnostics"})

-- all workspace errors
map("n", "<leader>ae", function()
    vim.diagnostic.setqflist({ severity = "E" })
end, { desc = "Workspace errors"})

-- all workspace warnings
map("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
end, { desc = "Workspace warnings"})

-- buffer diagnostics only
map("n", "<leader>bd", vim.diagnostic.setloclist, { desc = "Buffer diagnostics"})

map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
end, { desc = "Go to previous"})

map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
end, { desc = "Go to next"})



