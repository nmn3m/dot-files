return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'soft' -- soft, medium, hard
      vim.g.gruvbox_material_foreground = 'mix' -- material, mix, original
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        treesitter = true,
        flash = true,
        indent_blankline = { enabled = true },
        mason = true,
        telescope = { enabled = true },
        which_key = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night', -- storm, moon, night, day
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      theme = 'wave', -- wave, dragon, lotus
      background = { dark = 'wave', light = 'lotus' },
    },
  },
  {
    -- Theme switcher setup
    'morhetz/gruvbox', -- keep original gruvbox as an option
    lazy = false,
    priority = 999,
    config = function()
      vim.g.gruvbox_contrast_dark = 'soft'
      vim.g.gruvbox_transparent_bg = 1
      vim.g.gruvbox_italic = 0
      vim.g.gruvbox_bold = 0

      -- Available themes
      local themes = {
        { name = 'catppuccin-mocha', transparent = true },
        { name = 'gruvbox-material', transparent = true },
        { name = 'tokyonight-night', transparent = true },
        { name = 'kanagawa-wave', transparent = true },
        { name = 'gruvbox', transparent = true },
      }

      local current_theme = 1

      -- Apply transparency
      local function apply_transparency()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'NONE' })
      end

      -- Apply a theme
      local function apply_theme(index)
        local theme = themes[index]
        vim.cmd.colorscheme(theme.name)
        vim.o.background = 'dark'
        if theme.transparent then
          apply_transparency()
        end
        vim.notify('Theme: ' .. theme.name, vim.log.levels.INFO)
      end

      -- Cycle through themes with <leader>th
      vim.keymap.set('n', '<leader>ct', function()
        current_theme = current_theme % #themes + 1
        apply_theme(current_theme)
      end, { noremap = true, silent = true, desc = 'Cycle color themes' })

      -- Toggle transparency with <leader>bg
      local bg_transparent = true
      vim.keymap.set('n', '<leader>bg', function()
        bg_transparent = not bg_transparent
        if bg_transparent then
          apply_transparency()
        else
          vim.cmd.colorscheme(themes[current_theme].name)
        end
      end, { noremap = true, silent = true, desc = 'Toggle transparency' })

      -- Set default theme
      apply_theme(1)
    end,
  },
}
