local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "K",  vim.lsp.buf.hover, { desc = "Hover"})
map("n", "<leader>cl", vim.lsp.codelens.run, { desc = "Code lens"})
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature help"})
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename"})
map("n", "<leader>=", vim.lsp.buf.format, { desc = "Format"})
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

map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
end, { desc = "Go to previous"})

map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
end, { desc = "Go to next"})



