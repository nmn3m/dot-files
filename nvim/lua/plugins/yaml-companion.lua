return {
  'someone-stole-my-name/yaml-companion.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  ft = { 'yaml', 'yml' },
  keys = {
    { '<leader>ys', '<cmd>Telescope yaml_schema<cr>', desc = 'Select YAML Schema' },
  },
  config = function()
    require('telescope').load_extension('yaml_schema')
    local cfg = require('yaml-companion').setup({
      builtin_matchers = {
        kubernetes = { enabled = true },
      },
      schemas = {
        {
          name = 'Kubernetes',
          uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/all.json',
        },
      },
      lspconfig = {
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = false,
              url = '',
            },
          },
        },
      },
    })
    vim.lsp.config('yamlls', cfg)
    vim.lsp.enable('yamlls')
  end,
}
