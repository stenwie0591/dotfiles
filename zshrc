# PATH
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Editor
export EDITOR="vim"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# NVM (lazy load per velocizzare startup)
export NVM_DIR="$HOME/.nvm"
function nvm() {
    unfunction nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

# FZF
eval "$(fzf --zsh)"

# Aliases
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"
alias zshconfig="code ~/.zshrc"
alias torshield="source ~/tor-env/bin/activate && python ~/Documents/tor_shield.py"

# VS Code
function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# Zinit annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Plugins con Turbo mode
zinit wait lucid for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

# Completions
autoload -Uz compinit && compinit

# Node diretto senza chiamare nvm
export PATH="$NVM_DIR/versions/node/$(ls $NVM_DIR/versions/node | tail -1)/bin:$PATH"

# Zoxide (sostituto cd)
eval "$(zoxide init zsh)"

# Alias moderni
alias ls="eza --icons"
alias ll="eza -la --icons --git"
alias lt="eza --tree --icons"
alias cat="bat --paging=never"
alias top="btm"
eval $(thefuck --alias)
eval "$(starship init zsh)"
export STARSHIP_CACHE=~/.cache/starship
export GPG_TTY=$(tty)
eval "$(direnv hook zsh)"

# Plugin aggiuntivi
zinit wait lucid for \
    zsh-users/zsh-history-substring-search \
    MichaelAquilina/zsh-you-should-use

# History substring search con frecce
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Fast syntax highlighting (sostituto più veloce di zsh-syntax-highlighting)
zinit wait lucid for \
    zdharma-continuum/fast-syntax-highlighting
