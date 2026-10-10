return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  -- NOTE: the main branch requires the `tree-sitter` CLI and a C compiler to build parsers
  config = function()
    local ts = require 'nvim-treesitter'

    ts.install {
      'lua',
      'python',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      'regex',
      'terraform',
      'sql',
      'dockerfile',
      'toml',
      'json',
      'java',
      'groovy',
      'go',
      'gitignore',
      'graphql',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'tsx',
      'css',
      'html',
    }

    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    local regex_langs = { ruby = true }
    local available = {}
    for _, lang in ipairs(ts.get_available()) do
      available[lang] = true
    end

    local function attach(buf, lang)
      if not pcall(vim.treesitter.start, buf, lang) then
        return
      end
      if regex_langs[lang] then
        vim.bo[buf].syntax = 'on'
      else
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end
        if vim.treesitter.language.add(lang) then
          attach(args.buf, lang)
        elseif available[lang] then
          -- Autoinstall languages that are not installed
          ts.install(lang):await(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              attach(args.buf, lang)
            end
          end)
        end
      end,
    })
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
