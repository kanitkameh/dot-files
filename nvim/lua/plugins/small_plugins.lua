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

  {
    "folke/which-key.nvim", lazy = false , opts = {} ,
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

  {'tpope/vim-repeat'},

  {
    'easymotion/vim-easymotion',
    dependencies = {
      'tpope/vim-repeat',
    },
    keys ={
      {'f', '<Plug>(easymotion-overwin-f)', desc = 'EasyMotion Find'},
      {'F', '<Plug>(easymotion-overwin-F)', desc = 'EasyMotion Find Backwards'},
      {'t', '<Plug>(easymotion-overwin-t)', desc = 'EasyMotion Till'},
      {'T', '<Plug>(easymotion-overwin-T)', desc = 'EasyMotion Till Backwards'},
    },
    config = function()
      vim.g.EasyMotion_do_mapping = 0 -- disable default mappings
      vim.g.EasyMotion_smartcase = 1 -- enable smart case
      vim.g.EasyMotion_keys = 'qwertyuiopasdfghjklzxcvbnm'
    end
  },

  {'tpope/vim-commentary'},

  {'dyng/ctrlsf.vim'},

  {'vim-autoformat/vim-autoformat'},

  {'tommcdo/vim-exchange'},

  {'machakann/vim-highlightedyank'},

  {
    'AndrewRadev/yankwin.vim',
    keys = {
      {'<c-w>vp', '<cmd>call yankwin#Paste({"edit_command": "rightbelow vertical split"})<CR>', desc = 'YankWin Paste Right Split'},
      {'<c-w>vP', '<cmd>call yankwin#Paste({"edit_command": "leftabove vertical split"})<CR>', desc = 'YankWin Paste Left Split'},
    }
  },

  {'psliwka/vim-smoothie'},

  {
    'kanitkameh/glabmr.vim',
    keys = {
      {'<leader>mrl', '<cmd>MergeRequestList<CR>', desc = 'Glab MR List'},
      {'<leader>mrc', '<cmd>MergeRequestCreate<CR>', desc = 'Glab MR Create'},
      -- TODO use :wq and :q instead
      {'<leader>mrs', '<cmd>MergeRequestSubmit<CR>', desc = 'Glab MR Submit'},
    }
  },

  {'ziglang/zig.vim'},

  {
    'rhysd/reply.vim',
    keys = {
        {'<leader>rs', '<cmd>ReplSend<CR>', desc = 'Repl Send'},
        {'<leader>rr', '<cmd>ReplRecv<CR>', desc = 'Repl Recv'},
        {'<leader>ro', '<cmd>Repl<CR>', desc = 'Repl Open'},
        {'<leader>ra', '<cmd>ReplAuto<CR>', desc = 'Repl Auto'},
        {'<leader>rc', '<cmd>ReplStop<CR>', desc = 'Repl Stop'},
    }
  },

  {
    'omrisarig13/vim-mr-interface',
    dependencies = {
      {'google/vim-maktaba'},
      {'google/vim-glaive'},
      {'LucHermitte/lh-vim-lib'}
    }
  },

  {
    'kanitkameh/testsourcetoggle.vim',
    keys = {
      {'<leader>tst', '<cmd>TestSourceToggle<CR>', desc = 'Test Source Toggle'},
    }
  },

  { "tpope/vim-speeddating" },

}
