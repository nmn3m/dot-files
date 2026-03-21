# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

# Prevent oh-my-zsh from overriding tmux window names
DISABLE_AUTO_TITLE="true"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    kubectl
    rust
    sudo
    command-not-found
    fzf-tab
)

# Distro-specific plugins
if [ -f /etc/arch-release ]; then
    plugins+=(archlinux)
elif [ -f /etc/debian_version ]; then
    plugins+=(ubuntu)
fi

source $ZSH/oh-my-zsh.sh

# Show only current directory name in prompt
PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%1~$(git_prompt_info)%{$reset_color%} '

# Display Pokemon-colorscripts (if installed)
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
if command -v pokemon-colorscripts &>/dev/null && command -v fastfetch &>/dev/null; then
    pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
elif command -v fastfetch &>/dev/null; then
    fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc 2>/dev/null || fastfetch
fi

# Set-up icons for files/directories in terminal using lsd (if installed)
if command -v lsd &>/dev/null; then
    alias ls='lsd'
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'
else
    alias ls='ls --color=auto'
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls -l'
fi

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
if command -v fzf &>/dev/null; then
    # fzf 0.48+ supports --zsh, older versions use separate scripts
    if fzf --zsh &>/dev/null; then
        source <(fzf --zsh)
    elif [ -f /usr/share/fzf/key-bindings.zsh ]; then
        source /usr/share/fzf/key-bindings.zsh
    elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
        source /usr/share/doc/fzf/examples/key-bindings.zsh
    fi
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings (vim-style history search)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color "$realpath"'
if command -v go &>/dev/null; then
    export PATH=$PATH:$(go env GOPATH)/bin
fi

# NVM configuration
export NVM_DIR="$HOME/.nvm"
if [ -s "/usr/share/nvm/init-nvm.sh" ]; then
    source /usr/share/nvm/init-nvm.sh
elif [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

export PATH="$HOME/.cargo/bin:$PATH"

## adding dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

## adding etcd
export PATH="${PATH}:$HOME/workspace/github/opensource/kubernetes/third_party/etcd"

export PATH="$HOME/.local/bin:$PATH"

# Zoxide (smart cd - remembers your most visited directories)
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi
