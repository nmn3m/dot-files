# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    kubectl
    rust
    sudo
    command-not-found
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

# Show only current directory name in prompt
PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%1~$(git_prompt_info)%{$reset_color%} '

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
export PATH=$PATH:$(go env GOPATH)/bin

# NVM configuration
export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/init-nvm.sh

export PATH="$HOME/.cargo/bin:$PATH"

## adding dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

## adding etcd
export PATH="${PATH}:/home/nour/workspace/github/opensource/kubernetes/third_party/etcd"

export PATH="$HOME/.local/bin:$PATH"

# Zoxide (smart cd - remembers your most visited directories)
eval "$(zoxide init --cmd cd zsh)"
