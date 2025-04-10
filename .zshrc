ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light "zsh-users/zsh-history-substring-search"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "Aloxaf/fzf-tab"

# export PATH
export PATH=$PATH:/home/raphaelmso/.local/share/bob/nvim-bin
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# export environment variables 
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'

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

# Keys 
bindkey -v

# Shortcuts
alias n="nvim"
alias e="yazi"
alias dlv="yt-dlp -P ~/Videos/ytdlp/ --embed-chapters"
alias dla="yt-dlp -f m4a -P ~/Videos/ytdlp/"
alias ws="watch sensors"
alias ff="fastfetch"

# One liners 
alias fn='nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" )'
alias fcd='z $(fdfind . -td | fzf) && eza --icons'

# Remaps 
alias cat="bat"
alias cd="z"
alias l="eza -l --icons"
alias ls="eza --icons"
alias la="eza -la --icons"
alias erd="erd -y inverted -H"
alias erda="erd -y inverted -H -. --no-git"
alias grep="rg"

# Folder navigation 
alias cdn="z ~/.config/nvim/ && eza --icons"
alias cdd="z ~/Dev/dotfiles/ && eza --icons"
alias cdy="z ~/Downloads/ytdlp && eza --icons"
alias cdo="z ~/Documents/'Obsidian Vault'/"

# Tmux
alias t="tmux"
alias ta="tmux attach"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tka="tmux kill-server && rm -rf ~/.local/share/tmux/ressurect"
alias tkss="tmux kill-session -t"
alias tjr='tmux attach "$(tmux ls | sed '\''s/\x1b\[[0-9;]*m//g'\'' | awk '\''{print $0}'\'' | fzf)"'

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
