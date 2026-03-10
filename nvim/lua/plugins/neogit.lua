return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
    { '<leader>gl', '<cmd>Neogit log<cr>', desc = 'Git Log' },
    { '<leader>gp', '<cmd>Neogit push<cr>', desc = 'Git Push' },
    { '<leader>gP', '<cmd>Neogit pull<cr>', desc = 'Git Pull' },
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
    signs = {
      section = { '', '' },
      item = { '', '' },
    },
  },
}
