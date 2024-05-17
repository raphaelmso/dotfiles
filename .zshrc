# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "zap-zsh/completions"

# export
export PATH=$PATH:/home/raphael/.local/share/bob/nvim-bin
export EDITOR='nvim'
export VISUAL='nvim'

# PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats "%b %m%u%c "
zstyle ':vcs_info:*' check-for-changes true
setopt PROMPT_SUBST
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%2c%{$reset_color%} %F{red}${vcs_info_msg_0_}%f"
PROMPT+='%B%F{red}${vcs_info_msg_0_}%f%b'

# Binds
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down

# Shortcuts
alias n="nvim"
alias l="lazygit"
alias fn='nvim $(fzf)'
alias fcd='cd $(fdfind . -td | fzf) && eza --icons'
alias fts='cd $(fdfind . -td | fzf) && tmux new-session'
alias dl="yt-dlp -P ~/Downloads/ytdlp/"
alias ws="watch sensors"

# Remaps 
alias cat="bat"
alias tree="erd"
alias l="eza -l --icons"
alias ls="eza --icons"
alias la="eza -la --icons"

# Folder navigation 
alias cdn="cd ~/.config/nvim/ && eza --icons"
alias cdp="cd ~/Programming && eza --icons"
alias cdg="cd ~/Programming/Git/ && eza --icons"
alias cdd="cd ~/dotfiles/ && eza --icons"
alias cdr="cd ~/Programming/Rust/ && eza --icons"
alias cdrl="cd ~/Programming/Rust/Learning/ && eza --icons"
alias cdy="cd ~/Downloads/ytdlp && eza --icons"

# TMUX
alias t="tmux"
alias ta="tmux attach"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tka="tmux kill-server && rm -rf ~/.local/share/tmux/ressurect"
alias tkss="tmux kill-session -t"
alias td="tmux new-session -s dev"

# Load and initialise completion system
autoload -Uz compinit
compinit
