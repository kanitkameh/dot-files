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
      {'<leader>gws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Search LSP Symbols in Telescope'},
      {'<leader>gD', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Telescope LSP Type Definitions'},
      {'<leader>gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Telescope LSP Definitions'},
      {'<leader>gi', '<cmd>Telescope lsp_implementations<cr>', desc = 'Telescope LSP Implementations'},
      {'<leader>gr', '<cmd>Telescope lsp_references<cr>', desc = 'Telescope LSP References'},
      {'<leader>gci', '<cmd>Telescope lsp_incoming_calls<cr>', desc = 'Telescope LSP Incoming Calls'},
      {'<leader>gco', '<cmd>Telescope lsp_outgoing_calls<cr>', desc = 'Telescope LSP Outgoing Calls'},
      {'<leader>gds', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Telescope LSP Document Symbols'},
      {'<leader>bd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Telescope Buffer Diagnostics'},
    }
  },

}
