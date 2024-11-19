return {
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      opts_extend = { "ensure_installed" },
      opts = {
        ensure_installed = 'all',
        highlight = {
          enable = true,
        },
      },
      config = function (_, opts)
        if type(opts.ensure_installed) == "table" then
          opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)

        vim.o.foldmethod = 'expr'
        vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      end
  },
}
