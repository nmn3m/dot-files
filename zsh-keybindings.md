# Zsh Keybindings Reference

> Shell: Oh-My-Zsh with custom plugins

---

## [fzf](https://github.com/junegunn/fzf) — Fuzzy Finder

> Fuzzy search through history, files, directories, and processes directly from the terminal.

### Keybindings

| Key | Action |
|---|---|
| `Ctrl+r` | Fuzzy search command history |
| `Ctrl+t` | Fuzzy search files/directories and paste to command line |
| `Alt+c` | Fuzzy search directories and `cd` into it |

### Usage Examples

```bash
# Search history for docker commands
Ctrl+r → type "docker"

# Find a file and open it in nvim
nvim Ctrl+t → type "deploy"

# Jump into a directory
Alt+c → type "kubernetes"

# Pipe any output into fzf
cat ~/.zsh_history | fzf
ps aux | fzf
kubectl get pods | fzf
```

### fzf Inside Other Commands

```bash
# Kill a process interactively
kill -9 $(ps aux | fzf | awk '{print $2}')

# Git checkout branch interactively
git checkout $(git branch | fzf)

# Open a file found by fzf in nvim
nvim $(fzf)

# Preview files while searching
fzf --preview 'cat {}'
```

---

## [fzf-tab](https://github.com/Aloxaf/fzf-tab) — Fuzzy Tab Completion

> Replaces default zsh tab completion with fzf. Any time you press Tab, you get a fuzzy searchable list instead of cycling through matches.

### Usage

| Action | How |
|---|---|
| Trigger | Press `Tab` after any partial command |
| Search | Just type to filter results |
| Navigate | `Ctrl+j` / `Ctrl+k` or arrow keys |
| Select | `Enter` |
| Preview | Shows directory contents for `cd` completions |

### Examples

```bash
# Fuzzy complete file names
nvim Tab → type partial name → Enter

# Fuzzy complete git branches
git checkout Tab → type branch name

# Fuzzy complete kubectl resources
kubectl get Tab → select resource type
kubectl logs Tab → select pod name

# Fuzzy cd with directory preview
cd Tab → see directory contents in preview pane
```

---

## [zoxide](https://github.com/ajeetdsouza/zoxide) — Smart cd

> Remembers directories you visit and lets you jump to them with partial names. Replaces `cd` command.

| Command | Action |
|---|---|
| `cd foo` | Jump to most visited directory matching "foo" |
| `cd foo bar` | Jump to directory matching both "foo" and "bar" |
| `cdi` | Interactive mode — fuzzy search all visited directories |
| `zoxide query -ls` | List all remembered directories with scores |

### Examples

```bash
# Instead of typing full paths:
cd /home/nour/workspace/github/opensource/kubernetes

# Just type:
cd kubernetes

# Multiple keywords narrow it down:
cd github kubernetes

# Interactive selection:
cdi
```

---

## [kubectl plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl) — K8s Aliases

> Short aliases for common kubectl commands. Saves hundreds of keystrokes daily.

### Core

| Alias | Command |
|---|---|
| `k` | `kubectl` |
| `kaf` | `kubectl apply -f` |
| `kdf` | `kubectl delete -f` |

### Get Resources

| Alias | Command |
|---|---|
| `kgp` | `kubectl get pods` |
| `kgd` | `kubectl get deployments` |
| `kgs` | `kubectl get services` |
| `kgn` | `kubectl get nodes` |
| `kgns` | `kubectl get namespaces` |
| `kgi` | `kubectl get ingress` |
| `kgcm` | `kubectl get configmaps` |
| `kgsec` | `kubectl get secrets` |
| `kgss` | `kubectl get statefulsets` |
| `kgds` | `kubectl get daemonsets` |
| `kgrs` | `kubectl get replicasets` |
| `kgj` | `kubectl get jobs` |
| `kgcj` | `kubectl get cronjobs` |

### Describe

| Alias | Command |
|---|---|
| `kdp` | `kubectl describe pod` |
| `kdd` | `kubectl describe deployment` |
| `kds` | `kubectl describe service` |
| `kdn` | `kubectl describe node` |

### Logs & Exec

| Alias | Command |
|---|---|
| `kl` | `kubectl logs` |
| `klf` | `kubectl logs -f` (follow) |
| `keti` | `kubectl exec -ti` (shell into pod) |

### Context & Namespace

| Alias | Command |
|---|---|
| `kcuc` | `kubectl config use-context` |
| `kcgc` | `kubectl config get-contexts` |
| `kcn` | `kubectl config set-context --current --namespace` |

### Delete

| Alias | Command |
|---|---|
| `kdel` | `kubectl delete` |
| `kdelp` | `kubectl delete pod` |
| `kdeld` | `kubectl delete deployment` |
| `kdels` | `kubectl delete service` |

### Wide & Watch

| Alias | Command |
|---|---|
| `kgpw` | `kubectl get pods -w` (watch) |
| `kgpwide` | `kubectl get pods -o wide` |
| `kgdwide` | `kubectl get deployments -o wide` |

### Output Formats

| Alias | Command |
|---|---|
| `kgpy` | `kubectl get pods -o yaml` |
| `kgpj` | `kubectl get pods -o json` |
| `kgpall` | `kubectl get pods --all-namespaces` |

---

## [sudo plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) — Quick Sudo

> Press `Esc Esc` to prepend `sudo` to the current or last command.

| Key | Action |
|---|---|
| `Esc Esc` | Add `sudo` to current command |
| `Esc Esc` (empty line) | Re-run last command with `sudo` |

### Example

```bash
pacman -S neovim     # permission denied
Esc Esc              # becomes: sudo pacman -S neovim
```

---

## History Search

| Key | Action |
|---|---|
| `Ctrl+r` | Fuzzy search history (fzf) |
| `Ctrl+p` | Search history backward (prefix match) |
| `Ctrl+n` | Search history forward (prefix match) |
| `Up` | Previous command |
| `Down` | Next command |

### How `Ctrl+p/n` Differs from `Ctrl+r`

```bash
# Ctrl+p/n: prefix match — type "git" then Ctrl+p cycles through
# commands starting with "git"
git Ctrl+p → git push origin main
            → git commit -m "fix"
            → git status

# Ctrl+r: fuzzy match — searches anywhere in the command
Ctrl+r → type "deploy" → finds "kubectl apply -f deploy.yaml"
```

---

## [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — Fish-like Suggestions

> Shows a grayed-out suggestion as you type based on your history.

| Key | Action |
|---|---|
| `Right arrow` | Accept full suggestion |
| `Ctrl+f` | Accept full suggestion |
| `Alt+f` | Accept next word of suggestion |
| `Ctrl+e` | Move to end of line (accept suggestion) |

---

## [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — Command Colors

> Colors your commands as you type: green = valid command, red = invalid, underline = valid path.

No keybindings — works automatically.

---

## [command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found) — Package Suggestions

> When you type a command that doesn't exist, suggests which package to install.

### Example

```bash
$ htop
htop may be found in the following packages:
  extra/htop
```

---

## [archlinux plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux) — Pacman/Yay Aliases

| Alias | Command |
|---|---|
| `pacin` | `sudo pacman -S` (install) |
| `pacrem` | `sudo pacman -Rns` (remove) |
| `pacsyu` | `sudo pacman -Syu` (system update) |
| `pacsearch` | `pacman -Ss` (search) |
| `pacinfo` | `pacman -Qi` (package info) |
| `yain` | `yay -S` (AUR install) |
| `yaupg` | `yay -Syu` (AUR + system update) |
| `yasearch` | `yay -Ss` (AUR search) |

---

## Custom Aliases

| Alias | Command |
|---|---|
| `ls` | `lsd` (modern ls with icons) |
| `l` | `lsd -l` |
| `la` | `lsd -a` |
| `lla` | `lsd -la` |
| `lt` | `lsd --tree` |
