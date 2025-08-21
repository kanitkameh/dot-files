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
      {'gws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Search LSP Symbols in Telescope'},
      {'gD', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Telescope LSP Type Definitions'},
      {'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Telescope LSP Definitions'},
      {'gi', '<cmd>Telescope lsp_implementations<cr>', desc = 'Telescope LSP Implementations'},
      {'gr', '<cmd>Telescope lsp_references<cr>', desc = 'Telescope LSP References'},
      {'gci', '<cmd>Telescope lsp_incoming_calls<cr>', desc = 'Telescope LSP Incoming Calls'},
      {'gco', '<cmd>Telescope lsp_outgoing_calls<cr>', desc = 'Telescope LSP Outgoing Calls'},
      {'gds', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Telescope LSP Document Symbols'},
      {'<leader>bd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Telescope Buffer Diagnostics'},
    }
  },

}
