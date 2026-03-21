# dot-files

### Tools

- nvim
- tmux
- kitty
- zsh
- i3wm

### Setup

Works on Arch, Debian/Ubuntu, Fedora, and openSUSE.

```bash
git clone https://github.com/nour/dot-files.git ~/workspace/github/dot-files
cd ~/workspace/github/dot-files
./hack/install.sh
```

The installer will:
- Detect your distro and install all packages
- Set up oh-my-zsh with plugins
- Install TPM (tmux plugin manager) and NVM
- Create symlinks for nvim, tmux, zsh, and kitty

After install:
1. Log out and back in (for zsh)
2. Open tmux and press `prefix + I` to install plugins
3. Open nvim (Lazy installs plugins automatically)
