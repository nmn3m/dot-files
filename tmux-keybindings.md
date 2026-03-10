# Tmux Keybindings Reference

> Prefix key: `Ctrl+Space`

---

## Sessions

| Key | Action |
|---|---|
| `prefix + d` | Detach from session |
| `prefix + s` | List sessions (built-in, overridden — use `:choose-tree` instead) |
| `prefix + $` | Rename session |
| `prefix + (` | Previous session |
| `prefix + )` | Next session |

### [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) — Save & Restore Sessions

> Manually save your tmux session (windows, panes, layout) and restore it after reboot or tmux restart.

| Key | Action |
|---|---|
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |

---

## Windows

| Key | Action |
|---|---|
| `prefix + c` | Create new window |
| `prefix + ,` | Rename window |
| `prefix + &` | Close window |
| `prefix + w` | List windows |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + 1-9` | Switch to window by number |
| `Shift+Left` | Previous window (no prefix) |
| `Shift+Right` | Next window (no prefix) |
| `Alt+H` | Previous window (no prefix) |
| `Alt+L` | Next window (no prefix) |

---

## Panes — Splitting

| Key | Action |
|---|---|
| `prefix + v` | Split vertically (matches nvim `<leader>v`) |
| `prefix + s` | Split horizontally (matches nvim `<leader>h`) |
| `prefix + "` | Split horizontally (default) |
| `prefix + %` | Split vertically (default) |

> All splits open in the current directory.

---

## Panes — Navigation

### [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) — Seamless Nvim/Tmux Navigation

> Navigate between nvim splits and tmux panes with the same keybindings. No need to know if you're in nvim or tmux.

| Key | Action |
|---|---|
| `Ctrl+h` | Navigate left (works across nvim/tmux) |
| `Ctrl+j` | Navigate down (works across nvim/tmux) |
| `Ctrl+k` | Navigate up (works across nvim/tmux) |
| `Ctrl+l` | Navigate right (works across nvim/tmux) |

### Vim-style (with prefix)

| Key | Action |
|---|---|
| `prefix + h` | Select left pane |
| `prefix + j` | Select down pane |
| `prefix + k` | Select up pane |
| `prefix + l` | Select right pane |

### Alt-arrow (no prefix)

| Key | Action |
|---|---|
| `Alt+Left` | Select left pane |
| `Alt+Right` | Select right pane |
| `Alt+Up` | Select up pane |
| `Alt+Down` | Select down pane |

---

## Panes — Resize

| Key | Action |
|---|---|
| `prefix + Ctrl+h` | Resize left (repeatable) |
| `prefix + Ctrl+j` | Resize down (repeatable) |
| `prefix + Ctrl+k` | Resize up (repeatable) |
| `prefix + Ctrl+l` | Resize right (repeatable) |

---

## Panes — Other

| Key | Action |
|---|---|
| `prefix + x` | Close pane |
| `prefix + z` | Toggle pane zoom (fullscreen) |
| `prefix + !` | Convert pane to window |
| `prefix + q` | Show pane numbers (press number to select) |
| `prefix + {` | Swap pane left |
| `prefix + }` | Swap pane right |
| `prefix + Space` | Cycle pane layouts |

---

## Copy Mode (Vi Style)

> Matches nvim visual mode keybindings. Enter copy mode with `prefix + [`.

### [tmux-yank](https://github.com/tmux-plugins/tmux-yank) — Clipboard Integration

> Copies to system clipboard using `wl-copy` (Wayland). Works with mouse selection too.

| Key | Action |
|---|---|
| `prefix + [` | Enter copy mode |
| `v` | Start selection (like nvim visual mode) |
| `Ctrl+v` | Rectangle selection (like nvim visual block) |
| `y` | Yank selection to clipboard |
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next search match |
| `N` | Previous search match |
| `h/j/k/l` | Move cursor (vim style) |
| `w/b` | Move word forward/backward |
| `Ctrl+u` | Page up |
| `Ctrl+d` | Page down |
| `g` | Go to top |
| `G` | Go to bottom |
| `q` | Exit copy mode |

---

## General

| Key | Action |
|---|---|
| `prefix + r` | Reload tmux config |
| `prefix + :` | Command prompt |
| `prefix + ?` | List all keybindings |
| `prefix + t` | Show clock |

---

## [tmux-gruvbox](https://github.com/egel/tmux-gruvbox) — Theme

> Gruvbox dark theme for tmux statusbar matching nvim gruvbox theme.

No keybindings — applied automatically.

---

## Plugin Management (TPM)

| Key | Action |
|---|---|
| `prefix + I` | Install new plugins |
| `prefix + U` | Update plugins |
| `prefix + Alt+u` | Uninstall removed plugins |
