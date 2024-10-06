local map = vim.keymap.set

-- Auto format buffer on save
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.scala',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})
