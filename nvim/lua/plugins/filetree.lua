return {

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  { 'nvim-tree/nvim-tree.lua' , 
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
      { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "Find File in NvimTree" },
    },
    opts = {}
  },

}
