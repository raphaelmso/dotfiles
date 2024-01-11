# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "raphaelmso/zsh-prompt"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "zap-zsh/completions"

#Binds
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down


# Shortcuts
alias n="nvim"
alias nf='nvim $(fzf)'
alias ss="shutdown now"
alias sr="reboot"
alias dl="yt-dlp -P ~/Videos/yt-dlp/ -f mp4"

# Remaps 
alias cat="bat"
alias l="eza -l --icons"
alias ls="eza --icons"
alias la="eza -a --icons"

# Folder navigation 
alias cdn="cd ~/.config/nvim/"
alias cdt="cd ~/Programming/tests/"
alias cdp="cd ~/Programming"
alias cdg="cd ~/Programming/Git/"

# TMUX
alias t="tmux"
alias ta="tmux attach -t"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"

# Load and initialise completion system
autoload -Uz compinit
compinit
