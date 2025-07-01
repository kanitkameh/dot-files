return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  { "folke/which-key.nvim", lazy = false , opts = {} ,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },


  -- local plugins can also be configured with the dev option.
  -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from GitHub
  -- With the dev option, you can easily switch between the local and installed version of a plugin
  { "folke/noice.nvim" },

  {
    "j-hui/fidget.nvim",
    opts = {}
  },

  {
    'dgagn/diagflow.nvim',
    config = function()
        require('diagflow').setup()
    end
  },

  {'tpope/vim-fugitive'},

  {'Yggdroot/indentLine'},

  {'vim-airline/vim-airline'},

  {'luochen1990/rainbow'},

  {'Raimondi/delimitMate'},

  {'drmikehenry/vim-headerguard'},

  {'scrooloose/nerdtree'},

  {'junegunn/fzf'},

  {'junegunn/fzf.vim'},

  {'tpope/vim-surround'},

  {'dbakker/vim-paragraph-motion'},

  {'easymotion/vim-easymotion'},

  {'tpope/vim-commentary'},

  {'dyng/ctrlsf.vim'},

  {'vim-autoformat/vim-autoformat'},

  {'tommcdo/vim-exchange'},

  {'machakann/vim-highlightedyank'},

  {'AndrewRadev/yankwin.vim'},

  {'psliwka/vim-smoothie'},

  {'kanitkameh/glabmr.vim'},

  {'ziglang/zig.vim'},

  {'rhysd/reply.vim'},

  {
    'omrisarig13/vim-mr-interface',
    dependencies = {
      {'google/vim-maktaba'},
      {'google/vim-glaive'},
      {'LucHermitte/lh-vim-lib'}
    }
  },

  {'kanitkameh/testsourcetoggle.vim'},

  { "nvim-lua/plenary.nvim" },

  { "tpope/vim-speeddating" },

}
