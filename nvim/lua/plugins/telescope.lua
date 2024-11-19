return {

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      {'<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Search in Telescope'},
      {'<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files in Telescope'},
      {'<F4>', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Search LSP Symbols in Telescope'},
    }
  },

}
