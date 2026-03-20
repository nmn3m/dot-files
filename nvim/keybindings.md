# Neovim Keybindings Reference

## General

| Key | Mode | Action |
|---|---|---|
| `Space` | n | Leader key |
| `Ctrl+s` | n | Save file |
| `<leader>sn` | n | Save without auto-formatting |
| `Ctrl+q` | n | Quit |
| `x` | n | Delete character (without yanking) |
| `Ctrl+d` | n | Scroll down + center |
| `Ctrl+u` | n | Scroll up + center |
| `n` | n | Next search result + center |
| `N` | n | Previous search result + center |
| `<leader>lw` | n | Toggle line wrap |
| `<` | v | Indent left (stay in visual) |
| `>` | v | Indent right (stay in visual) |
| `p` | v | Paste without losing yanked text |

## Window Management

| Key | Mode | Action |
|---|---|---|
| `<leader>v` | n | Split vertically |
| `<leader>h` | n | Split horizontally |
| `<leader>se` | n | Equalize split sizes |
| `<leader>xs` | n | Close current split |
| `Ctrl+k` | n | Navigate to upper split |
| `Ctrl+j` | n | Navigate to lower split |
| `Ctrl+h` | n | Navigate to left split |
| `Ctrl+l` | n | Navigate to right split |
| `Up` | n | Resize split (decrease height) |
| `Down` | n | Resize split (increase height) |
| `Left` | n | Resize split (decrease width) |
| `Right` | n | Resize split (increase width) |

## Buffers

| Key | Mode | Action |
|---|---|---|
| `Tab` | n | Next buffer |
| `Shift+Tab` | n | Previous buffer |
| `<leader>x` | n | Close buffer |
| `<leader>b` | n | New buffer |

## Tabs

| Key | Mode | Action |
|---|---|---|
| `<leader>to` | n | Open new tab |
| `<leader>tx` | n | Close current tab |
| `<leader>tn` | n | Next tab |
| `<leader>tp` | n | Previous tab |

## Diagnostics

| Key | Mode | Action |
|---|---|---|
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |
| `<leader>d` | n | Open floating diagnostic |
| `<leader>q` | n | Open diagnostics list |

---

## [Telescope](https://github.com/nvim-telescope/telescope.nvim) — Fuzzy Finder

> Fuzzy find files, grep text, search keymaps, buffers, and more across your project.

| Key | Mode | Action |
|---|---|---|
| `<leader>sf` | n | Search files |
| `<leader>sg` | n | Search by grep (live grep) |
| `<leader>sw` | n | Search current word |
| `<leader>sh` | n | Search help tags |
| `<leader>sk` | n | Search keymaps |
| `<leader>ss` | n | Search select Telescope pickers |
| `<leader>sd` | n | Search diagnostics |
| `<leader>sr` | n | Resume last search |
| `<leader>s.` | n | Search recent files |
| `<leader><leader>` | n | Find existing buffers |
| `<leader>/` | n | Fuzzy search in current buffer |
| `<leader>s/` | n | Live grep in open files |

### Telescope Insert Mode (inside picker)

| Key | Action |
|---|---|
| `Ctrl+j` | Move to next result |
| `Ctrl+k` | Move to previous result |
| `Ctrl+l` | Open selected file |

---

## [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) — File Explorer

> Sidebar file tree with git status, file operations, and fuzzy search. Like VS Code's sidebar.

| Key | Mode | Action |
|---|---|---|
| `<leader>e` | n | Toggle file explorer |
| `<leader>ngs` | n | Open git status (floating) |
| `\` | n | Reveal current file in tree |

### Inside Neo-tree

| Key | Action |
|---|---|
| `l` / `Enter` | Open file |
| `S` | Open in horizontal split |
| `s` | Open in vertical split |
| `t` | Open in new tab |
| `w` | Open with window picker |
| `P` | Toggle preview (floating) |
| `a` | Add file |
| `A` | Add directory |
| `d` | Delete |
| `r` | Rename |
| `y` | Copy to clipboard |
| `x` | Cut to clipboard |
| `p` | Paste from clipboard |
| `c` | Copy (with destination prompt) |
| `m` | Move (with destination prompt) |
| `C` | Close node |
| `z` | Close all nodes |
| `q` | Close Neo-tree |
| `R` | Refresh |
| `H` | Toggle hidden files |
| `/` | Fuzzy finder |
| `D` | Fuzzy finder (directories) |
| `#` | Fuzzy sorter |
| `<bs>` | Navigate up |
| `.` | Set root |
| `[g` | Previous git modified file |
| `]g` | Next git modified file |
| `i` | Show file details |
| `?` | Show help |

### Neo-tree Order By

| Key | Action |
|---|---|
| `oc` | Order by created |
| `od` | Order by diagnostics |
| `og` | Order by git status |
| `om` | Order by modified |
| `on` | Order by name |
| `os` | Order by size |
| `ot` | Order by type |

### Neo-tree Git Status Window

| Key | Action |
|---|---|
| `A` | Git add all |
| `gu` | Git unstage file |
| `ga` | Git add file |
| `gr` | Git revert file |
| `gc` | Git commit |
| `gp` | Git push |
| `gg` | Git commit and push |

---

## [LSP](https://github.com/neovim/nvim-lspconfig) — Language Server Protocol

> Go-to-definition, references, rename, code actions, and diagnostics for all languages. Powered by Mason for auto-installing language servers.

| Key | Mode | Action |
|---|---|---|
| `gd` | n | Go to definition |
| `gr` | n | Go to references |
| `gI` | n | Go to implementation |
| `gD` | n | Go to declaration |
| `<leader>D` | n | Type definition |
| `<leader>ds` | n | Document symbols |
| `<leader>ws` | n | Workspace symbols |
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n, v | Code action |
| `<leader>th` | n | Toggle inlay hints |

---

## [nvim-dap](https://github.com/mfussenegger/nvim-dap) — Debugging (Go)

> Debug Go code with Delve. Set breakpoints, step through code, inspect variables, and debug individual tests. Uses nvim-dap-go for Go-specific integration and nvim-dap-ui for a visual debug panel.

| Key | Mode | Action |
|---|---|---|
| `<F5>` | n | Start / Continue |
| `<F10>` | n | Step Over |
| `<F11>` | n | Step Into |
| `<F12>` | n | Step Out |
| `<leader>db` | n | Toggle Breakpoint |
| `<leader>dB` | n | Conditional Breakpoint |
| `<leader>dl` | n | Log Point |
| `<leader>dr` | n | Open REPL |
| `<leader>dt` | n | Debug Go Test (under cursor) |
| `<leader>du` | n | Toggle Debug UI |

---

## Go Testing

> Quick keybindings to run Go tests without leaving the editor.

| Key | Mode | Action |
|---|---|---|
| `<leader>tt` | n | Run all tests (`go test ./...`) |
| `<leader>tf` | n | Run tests in current file (runs from file's directory) |
| `<leader>tc` | n | Run tests without cache |

Tests run in a split terminal buffer. Press `Ctrl+c` to cancel, `q` to close the split.

---

## [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — Autocompletion

> Intelligent autocompletion with LSP, snippets, buffer words, and file paths. Uses LuaSnip for snippet expansion.

| Key | Mode | Action |
|---|---|---|
| `Tab` | i, s | Next completion item / expand snippet |
| `Shift+Tab` | i, s | Previous completion item / jump back |
| `Ctrl+n` | i | Next completion item |
| `Ctrl+p` | i | Previous completion item |
| `Ctrl+y` | i | Accept completion |
| `Ctrl+Space` | i | Trigger completion manually |
| `Ctrl+b` | i | Scroll docs up |
| `Ctrl+f` | i | Scroll docs down |
| `Ctrl+l` | i, s | Jump to next snippet placeholder |
| `Ctrl+h` | i, s | Jump to previous snippet placeholder |

---

## [Comment.nvim](https://github.com/numToStr/Comment.nvim) — Toggle Comments

> Quickly comment/uncomment lines or selections. Works with any language via treesitter.

| Key | Mode | Action |
|---|---|---|
| `Ctrl+/` | n | Toggle comment (current line) |
| `Ctrl+c` | n | Toggle comment (current line) |
| `Ctrl+/` | v | Toggle comment (selection) |
| `Ctrl+c` | v | Toggle comment (selection) |

---

## [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) — Git Gutter

> Shows git diff signs in the gutter (added, modified, deleted lines) in real time.

| Symbol | Meaning |
|---|---|
| `+` | Added line |
| `~` | Changed line |
| `_` | Deleted line |
| `‾` | Top-deleted line |

---

## [Git Blame](https://github.com/f-person/git-blame.nvim) — Inline Blame

> Shows inline git blame at the end of each line with author, date, and commit summary. Useful for understanding who changed what and why.

Inline blame shown automatically with format: `summary • date • author • sha`

---

## [Bufferline](https://github.com/akinsho/bufferline.nvim) — Buffer Tabs

> Shows open buffers as tabs at the top of the screen, like browser tabs or VS Code tabs.

| Key | Mode | Action |
|---|---|---|
| `Tab` | n | Next buffer |
| `Shift+Tab` | n | Previous buffer |
| `<leader>x` | n | Close buffer |

---

## Color Themes

> 5 themes installed with transparency support. Cycle between them or toggle transparency.

**Installed themes:**
1. [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) — Warm retro, upgraded gruvbox with better treesitter support (default)
2. [Catppuccin Mocha](https://github.com/catppuccin/nvim) — Modern soft pastels, great contrast
3. [TokyoNight](https://github.com/folke/tokyonight.nvim) — Clean dark blues, VS Code feel
4. [Kanagawa Wave](https://github.com/rebelot/kanagawa.nvim) — Japanese-inspired warm tones
5. [Gruvbox Classic](https://github.com/morhetz/gruvbox) — Original gruvbox

| Key | Mode | Action |
|---|---|---|
| `<leader>ct` | n | Cycle to next theme |
| `<leader>bg` | n | Toggle background transparency |

---

## [Lualine](https://github.com/nvim-lualine/lualine.nvim) — Statusline

> Bottom status bar showing mode, git branch, filename, diagnostics, diff, encoding, filetype, and cursor position.

No keybindings — displays automatically.

---

## [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) — Indent Guides

> Shows vertical indent guide lines to help visualize code nesting. Essential for YAML, Python, and deeply nested code.

No keybindings — shows indent guides automatically with `▏` character.

---

## [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim) — Live Preview

> Opens a live-updating markdown preview in your browser. Useful for writing docs, READMEs, and K8s documentation.

| Key | Mode | Action |
|---|---|---|
| `<leader>mp` | n | Start preview in browser |
| `<leader>ms` | n | Stop preview |

---

## [Diffview](https://github.com/sindrets/diffview.nvim) — Side-by-Side Diff

> VS Code-style side-by-side diff viewer. View file changes, file history, and resolve merge conflicts visually. Essential for PR reviews.

| Key | Mode | Action |
|---|---|---|
| `<leader>gd` | n | Open diff view (working tree vs index) |
| `<leader>gh` | n | File history (current file) |
| `<leader>gH` | n | File history (entire repo) |
| `<leader>gc` | n | Close diff view |

### Inside Diffview

| Key | Action |
|---|---|
| `Tab` | Next file in diff |
| `Shift+Tab` | Previous file in diff |
| `<leader>e` | Toggle file panel |
| `]x` | Next conflict |
| `[x` | Previous conflict |
| `gf` | Open file |

### Compare Against Specific Commits

```vim
:DiffviewOpen              " working tree vs staged
:DiffviewOpen HEAD~1       " compare with last commit
:DiffviewOpen main..HEAD   " compare branch against main
:DiffviewOpen origin/main  " compare with remote main
```

---

## [Neogit](https://github.com/NeogitOrg/neogit) — Git UI

> Full interactive git client inside nvim. Stage hunks, commit, push, pull, rebase, merge, branch — all without leaving the editor. Replaces vim-fugitive.

| Key | Mode | Action |
|---|---|---|
| `<leader>gg` | n | Open Neogit status |
| `<leader>gl` | n | Git log |
| `<leader>gp` | n | Git push |
| `<leader>gP` | n | Git pull |

### Inside Neogit Status

| Key | Action |
|---|---|
| `s` | Stage file/hunk |
| `u` | Unstage file/hunk |
| `c` | Open commit popup |
| `p` | Open push popup |
| `P` | Open pull popup |
| `r` | Open rebase popup |
| `m` | Open merge popup |
| `b` | Open branch popup |
| `l` | Open log popup |
| `Z` | Open stash popup |
| `Tab` | Toggle diff for file |
| `x` | Discard changes |
| `Enter` | Open file |
| `q` | Close Neogit |
| `$` | Show git command history |
| `?` | Show help |

---

## [Git Conflict](https://github.com/akinsho/git-conflict.nvim) — Merge Conflict Resolver

> Highlights merge conflicts and provides keymaps to quickly choose ours/theirs/both. Essential for K8s contributions with frequent merge conflicts.

| Key | Mode | Action |
|---|---|---|
| `co` | n | Choose ours (current) |
| `ct` | n | Choose theirs (incoming) |
| `cb` | n | Choose both |
| `c0` | n | Choose none |
| `]x` | n | Next conflict |
| `[x` | n | Previous conflict |

---

## [YAML Companion](https://github.com/someone-stole-my-name/yaml-companion.nvim) — K8s Schema Validation

> Auto-detects and applies Kubernetes CRD/JSON schemas to YAML files. Gives you autocompletion and validation for K8s manifests, Helm values, Docker Compose, etc.

| Key | Mode | Action |
|---|---|---|
| `<leader>ys` | n | Select YAML schema (K8s, Docker Compose, etc.) |

---

## [Trouble](https://github.com/folke/trouble.nvim) — Diagnostics Panel

> Better diagnostics list — see all errors, warnings, and symbols across your project in one organized panel. Replaces the default quickfix list.

| Key | Mode | Action |
|---|---|---|
| `<leader>xx` | n | Toggle diagnostics (all files) |
| `<leader>xX` | n | Toggle diagnostics (current buffer) |
| `<leader>cs` | n | Toggle symbols outline |
| `<leader>xL` | n | Toggle location list |
| `<leader>xQ` | n | Toggle quickfix list |

---

## [UFO](https://github.com/kevinhwang91/nvim-ufo) — Code Folding

> Smart code folding powered by treesitter. Collapse/expand functions, classes, and YAML blocks. Peek at folded content without unfolding.

| Key | Mode | Action |
|---|---|---|
| `zR` | n | Open all folds |
| `zM` | n | Close all folds |
| `zK` | n | Peek folded lines under cursor |
| `za` | n | Toggle fold (built-in) |
| `zo` | n | Open fold (built-in) |
| `zc` | n | Close fold (built-in) |

---

## [Flash](https://github.com/folke/flash.nvim) — Jump Navigation

> Lightning-fast cursor movement. Press `s` + 2 characters to jump anywhere on screen instantly. Huge speed boost for navigating large YAML/Go files.

| Key | Mode | Action |
|---|---|---|
| `s` | n, x, o | Flash jump — type 2 chars to jump anywhere |
| `S` | n, x, o | Flash treesitter — select treesitter nodes |
| `r` | o | Remote flash (operator-pending) |
| `R` | o, x | Treesitter search |

---

## [Mini Surround](https://github.com/echasnovski/mini.surround) — Surround Operations

> Quickly add, delete, or replace surrounding characters (quotes, brackets, tags). Essential for editing YAML strings, Go structs, and JSON.

| Key | Mode | Action |
|---|---|---|
| `sa` | n, v | Add surrounding (e.g. `saiw"` wraps word in quotes) |
| `sd` | n | Delete surrounding (e.g. `sd"` removes quotes) |
| `sr` | n | Replace surrounding (e.g. `sr"'` changes `"` to `'`) |
| `sf` | n | Find surrounding (to the right) |
| `sF` | n | Find surrounding (to the left) |
| `sh` | n | Highlight surrounding |
| `sn` | n | Update `n_lines` search range |

---

## [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — Syntax Highlighting

> Advanced syntax highlighting and code understanding. Provides accurate highlighting for 30+ languages including Go, Python, YAML, Terraform, Dockerfile, and Helm templates.

No keybindings — works automatically for all supported languages.

---

## [none-ls](https://github.com/nvimtools/none-ls.nvim) — Formatting & Linting

> Auto-formats code on save using prettier (HTML/JSON/YAML/MD), shfmt (shell), ruff (Python), and terraform_fmt. Also runs linters like checkmake and eslint.

No keybindings — formats automatically on save (`:w`). Use `<leader>sn` to save without formatting.

---

## Misc Plugins

### [Which-Key](https://github.com/folke/which-key.nvim) — Keybind Hints

> Pops up a panel after pressing leader key showing all available keybindings. Helps you discover and remember shortcuts.

### [Vim-Tmux-Navigator](https://github.com/christoomey/vim-tmux-navigator) — Seamless Navigation

> Navigate between nvim splits and tmux panes using the same keybindings. No need to switch mental models.

| Key | Action |
|---|---|
| `Ctrl+h` | Navigate left (across vim/tmux) |
| `Ctrl+j` | Navigate down (across vim/tmux) |
| `Ctrl+k` | Navigate up (across vim/tmux) |
| `Ctrl+l` | Navigate right (across vim/tmux) |

### [Autopairs](https://github.com/windwp/nvim-autopairs) — Auto-close Brackets

> Automatically closes `(`, `[`, `{`, `"`, `'` when typing. Saves keystrokes and prevents mismatched brackets.

### [Todo Comments](https://github.com/folke/todo-comments.nvim) — Highlight TODOs

> Highlights keywords in comments and lets you search them across the project. Great for tracking work in large codebases.

| Command | Action |
|---|---|
| `:TodoTelescope` | Search all TODO/FIXME/HACK/NOTE comments |

Highlights: `TODO`, `FIXME`, `HACK`, `NOTE`, `WARNING`, `PERF`

### [Colorizer](https://github.com/norcalli/nvim-colorizer.lua) — Color Previews

> Highlights color codes like `#ff0000` with their actual color inline. Useful for CSS, Tailwind, and theme files.

### [Vim-Sleuth](https://github.com/tpope/vim-sleuth) — Auto-detect Indentation

> Automatically detects and sets the correct indentation (tabs vs spaces, width) based on the file content.

### [Vim-Helm](https://github.com/towolf/vim-helm) — Helm Template Syntax

> Applies proper syntax highlighting for Helm templates (Go templates inside YAML). Essential for K8s Helm chart development.
