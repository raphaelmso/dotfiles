ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# source it befora zsh-helix-mode
source <(fzf --zsh)

zinit light "Multirious/zsh-helix-mode"
zinit ice wait"1" lucid
zinit light "zsh-users/zsh-autosuggestions"

# export PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# export environment variables 
export EDITOR='hx'

# History 
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

alias fn='hx $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" )'
alias fcd='z $(fdfind . -td | fzf) && eza --icons'

# Remaps 
alias cd="z"
alias ls="eza --icons"
alias erd="erd -y inverted -H"
alias erda="erd -y inverted -H -. --no-git"
alias grep="rg"

alias zjr='zellij attach "$(zellij ls | sed '\''s/\x1b\[[0-9;]*m//g'\'' | awk '\''{print $1}'\'' | fzf)"'
alias zjs="zellij --session"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi


# needs to be loaded after compinit
zinit light "Aloxaf/fzf-tab"

# make fzf-tab work with helix mode
bindkey '^I' fzf-tab-complete
