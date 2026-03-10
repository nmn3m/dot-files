return {
  'ramilito/kubectl.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  build = 'make',
  keys = {
    { '<leader>k', '<cmd>lua require("kubectl").toggle()<cr>', desc = 'Toggle Kubectl' },
  },
  opts = {},
}
