return {
  require('nvim-treesitter.configs').setup {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<Leader>gvi',
        node_incremental = '<Leader>gvn',
        scope_incremental = '<Leader>gvc',
        node_decremental = '<Leader>gvd',
      },
    },
  },
}
