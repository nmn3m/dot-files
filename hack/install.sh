#!/usr/bin/env bash
set -euo pipefail

# ── Colors ───────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()   { echo -e "${RED}[ERROR]${NC} $*"; exit 1; }

# Secure curl: enforce HTTPS, TLS 1.2+, follow redirects safely
scurl() {
    curl --proto '=https' --tlsv1.2 -fsSL "$@"
}

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# ── Distro Detection ────────────────────────────────────────────
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO_ID="$ID"
        DISTRO_LIKE="${ID_LIKE:-$ID}"
    elif [ -f /etc/arch-release ]; then
        DISTRO_ID="arch"
        DISTRO_LIKE="arch"
    elif [ -f /etc/debian_version ]; then
        DISTRO_ID="debian"
        DISTRO_LIKE="debian"
    else
        err "Could not detect distro"
    fi

    case "$DISTRO_LIKE" in
        *arch*)   PKG_FAMILY="arch" ;;
        *debian*) PKG_FAMILY="debian" ;;
        *fedora*|*rhel*) PKG_FAMILY="fedora" ;;
        *suse*)   PKG_FAMILY="suse" ;;
        *)        PKG_FAMILY="$DISTRO_ID" ;;
    esac

    info "Detected: $DISTRO_ID (family: $PKG_FAMILY)"
}

# ── Package Install ─────────────────────────────────────────────
pkg_install() {
    case "$PKG_FAMILY" in
        arch)   sudo pacman -S --needed --noconfirm "$@" ;;
        debian) sudo apt-get install -y "$@" ;;
        fedora) sudo dnf install -y "$@" ;;
        suse)   sudo zypper install -y "$@" ;;
        *)      err "Unsupported: $PKG_FAMILY" ;;
    esac
}

# ── Install Core Packages ───────────────────────────────────────
install_packages() {
    info "Installing core packages..."

    if [ "$PKG_FAMILY" = "debian" ]; then
        sudo apt-get update -qq
    fi

    # Core packages (same name everywhere)
    local common="git curl wget zsh tmux fzf ripgrep unzip fontconfig xclip"

    # wl-clipboard only if Wayland is available
    if [ -n "${WAYLAND_DISPLAY:-}" ] || [ -d /usr/share/wayland-protocols ]; then
        common="$common wl-clipboard"
    fi

    case "$PKG_FAMILY" in
        arch)
            pkg_install $common neovim gcc make go lsd zoxide fastfetch nodejs npm python kitty
            ;;
        debian)
            pkg_install $common neovim gcc make golang-go nodejs npm python3 kitty
            # lsd: available on Ubuntu 23.04+/Debian 12+, fallback to cargo
            if apt-cache show lsd &>/dev/null; then
                pkg_install lsd
            elif command -v cargo &>/dev/null; then
                info "lsd not in repos, installing via cargo..."
                cargo install lsd
            else
                warn "lsd not available (install cargo first, then: cargo install lsd)"
            fi
            # zoxide: not in older repos
            if ! command -v zoxide &>/dev/null; then
                info "Installing zoxide via install script..."
                scurl https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
            fi
            # fastfetch: available on Ubuntu 24.04+
            if ! command -v fastfetch &>/dev/null; then
                if apt-cache show fastfetch &>/dev/null; then
                    pkg_install fastfetch
                else
                    warn "fastfetch not in repos, install manually"
                fi
            fi
            ;;
        fedora)
            pkg_install $common neovim gcc make golang lsd zoxide fastfetch nodejs npm python3 kitty
            ;;
        suse)
            pkg_install $common neovim gcc make go nodejs npm python3 kitty
            if ! command -v lsd &>/dev/null; then
                if command -v cargo &>/dev/null; then
                    info "Installing lsd via cargo..."
                    cargo install lsd
                else
                    warn "lsd not available (install cargo first, then: cargo install lsd)"
                fi
            fi
            if ! command -v zoxide &>/dev/null; then
                info "Installing zoxide via install script..."
                scurl https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
            fi
            ;;
    esac

    ok "Core packages installed"
}

# ── Install Oh-My-Zsh + Plugins ─────────────────────────────────
install_ohmyzsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        ok "oh-my-zsh already installed"
    else
        info "Installing oh-my-zsh..."
        RUNZSH=no CHSH=no sh -c "$(scurl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        ok "oh-my-zsh installed"
    fi

    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    local plugins=(
        "zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions"
        "zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting"
        "fzf-tab https://github.com/Aloxaf/fzf-tab"
    )

    for entry in "${plugins[@]}"; do
        local name="${entry%% *}"
        local url="${entry##* }"
        if [ ! -d "$ZSH_CUSTOM/plugins/$name" ]; then
            info "Installing $name..."
            git clone --depth 1 "$url" "$ZSH_CUSTOM/plugins/$name"
        fi
    done

    ok "oh-my-zsh plugins ready"
}

# ── Install TPM (Tmux Plugin Manager) ───────────────────────────
install_tpm() {
    local TPM_DIR="$HOME/.config/tmux/plugins/tpm"
    if [ -d "$TPM_DIR" ]; then
        ok "TPM already installed"
        return
    fi
    info "Installing TPM..."
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
    ok "TPM installed (run prefix + I in tmux to install plugins)"
}

# ── Install NVM ─────────────────────────────────────────────────
install_nvm() {
    if [ -d "$HOME/.nvm" ] || [ -s "/usr/share/nvm/init-nvm.sh" ]; then
        ok "NVM already installed"
        return
    fi
    info "Installing NVM..."
    scurl https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    ok "NVM installed"
}

# ── Symlinks ─────────────────────────────────────────────────────
create_symlink() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        warn "Backing up $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi

    ln -s "$src" "$dst"
    ok "Linked $dst -> $src"
}

setup_symlinks() {
    info "Creating symlinks..."
    create_symlink "$DOTFILES_DIR/nvim"        "$HOME/.config/nvim"
    create_symlink "$DOTFILES_DIR/tmux.conf"   "$HOME/.config/tmux/tmux.conf"
    create_symlink "$DOTFILES_DIR/.zshrc"      "$HOME/.zshrc"
    create_symlink "$DOTFILES_DIR/kitty.conf"  "$HOME/.config/kitty/kitty.conf"

    if [ -d "$DOTFILES_DIR/kitty-themes" ]; then
        create_symlink "$DOTFILES_DIR/kitty-themes" "$HOME/.config/kitty/kitty-themes"
    fi

    ok "Symlinks created"
}

# ── Set Default Shell ────────────────────────────────────────────
set_default_shell() {
    local zsh_path
    zsh_path="$(command -v zsh)"
    if [ "$SHELL" = "$zsh_path" ]; then
        ok "zsh is already default shell"
        return
    fi
    info "Setting zsh as default shell..."
    chsh -s "$zsh_path"
    ok "Default shell set to zsh (re-login to take effect)"
}

# ── Main ─────────────────────────────────────────────────────────
main() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║        Dotfiles Installer            ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
    echo ""

    detect_distro
    install_packages
    install_ohmyzsh
    install_tpm
    install_nvm
    setup_symlinks
    set_default_shell

    echo ""
    echo -e "${GREEN}Done! Next steps:${NC}"
    echo "  1. Log out and back in (for zsh)"
    echo "  2. Open tmux → prefix + I (install plugins)"
    echo "  3. Open nvim (Lazy installs plugins automatically)"
    echo ""
}

main "$@"
