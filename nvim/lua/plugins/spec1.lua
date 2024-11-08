local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

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

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" }
    },
    config = function () 
        local cmp = require("cmp")
        cmp.setup(
        {
            sources = {
                { name = "nvim_lsp" },
                { name = "vsnip" },
            },
            snippet = {
                expand = function(args)
                    -- Comes from vsnip
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- None of this made sense to me when first looking into this since there
                -- is no vim docs, but you can't have select = true here _unless_ you are
                -- also using the snippet stuff. So keep in mind that if you remove
                -- snippets you need to remove this select
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                -- I use tabs... some say you should stick to ins-completion but this is just here as an example
                ["<C-n>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ["<C-p>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
            }),
        })
    end,
  },

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
    "mfussenegger/nvim-dap",
    config = function()
        require("dap").configurations.scala = {
            {
                type = "scala",
                request = "launch",
                name = "RunOrTest",
                metals = {
                    runType = "runOrTestFile",
                    --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
                },
            },
            {
                type = "scala",
                request = "launch",
                name = "Test Target",
                metals = {
                    runType = "testTarget",
                },
            },
        }
    end,
    keys = {
        {"<leader>dc", ":lua require(\"dap\").continue()<cr>"},
        {"<leader>dr", ":lua require(\"dap\").repl.toggle()<cr>"},
        {"<leader>dK", ":lua require(\"dap.ui.widgets\").hover()<cr>"},
        {"<leader>db", ":lua require(\"dap\").toggle_breakpoint()<cr>"},
        {"<leader>dso", ":lua require(\"dap\").step_over()<cr>"},
        {"<leader>dsi", ":lua require(\"dap\").step_into()<cr>"},
        {"<leader>dl", ":lua require(\"dap\").run_last()<cr>"}
    }
  },

  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        "mfussenegger/nvim-dap",
        "j-hui/fidget.nvim"
    },
    opts = function()
        local function metals_status_handler(err, status, ctx)
          local val = {}
          -- trim and remove spinner
          local text = status.text:gsub('[⠇⠋⠙⠸⠴⠦]', ''):gsub("^%s*(.-)%s*$", "%1")
          if status.hide then
            val = {kind = "end"}
          elseif status.show then
            val = {kind = "begin", title = text}
          elseif status.text then
            val = {kind = "report", message = text}
          else
            return
          end
          local msg = {token = "metals", value = val}
          vim.lsp.handlers["$/progress"](err, msg, ctx)
        end

        local metals_config = require("metals").bare_config()
        -- Example of settings
        metals_config.settings = {
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        }
        -- we use fidget for the status
        metals_config.init_options.statusBarProvider = "off"
        metals_config.handlers = { ['metals/status'] = metals_status_handler }
        -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
        metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

        local function on_lsp_attach(client)
            -- Check if LSP document highlighting is supported by the server.
            if client.server_capabilities.documentHighlightProvider then
                -- Create the autocmd and augroup for document highlighting.
                vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = true })
                vim.api.nvim_create_autocmd({'CursorHold'}, {
                    buffer = 0,
                    group = 'LspDocumentHighlight',
                    callback = vim.lsp.buf.document_highlight
                })
                vim.api.nvim_create_autocmd({'CursorMoved'}, {
                    buffer = 0,
                    group = 'LspDocumentHighlight',
                    callback = vim.lsp.buf.clear_references
                })
            end
        end

        metals_config.on_attach = function(client, bufnr)
            on_lsp_attach(client)
            require("metals").setup_dap()
        end

        return metals_config
    end,
    config = function (self, metals_config)
        -- Autocmd that will actually be in charging of starting the whole thing
        local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
        api.nvim_create_autocmd("FileType", {
            -- NOTE: You may or may not want java included here. You will need it if you
            -- want basic Java support but it may also conflict if you are using
            -- something like nvim-jdtls which also works on a java filetype autocmd.
            pattern = self.ft,
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end,
    keys = {
        -- Metals worksheet show long lines
        {"<leader>K", "require(\"metals\").hover_worksheet()"},
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
    },
    keys = {
      {'<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Search in Telescope'},
    }
  },

  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate'
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
        "j-hui/fidget.nvim"
    },
    config = function()
        require('lualsp')
        require'lspconfig'.pyright.setup{}
    end
  },

  {
    'dgagn/diagflow.nvim',
    config = function()
        require('diagflow').setup()
    end
  },

  {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            gitcommit = true,
        }
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

}
