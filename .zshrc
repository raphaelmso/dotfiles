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
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH


export EDITOR='nvim'
export VISUAL='nvim'

export PF_INFO="ascii title os host kernel cpu memory pkgs uptime"

# Binds
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down

# Shortcuts
alias n="nvim"
alias lg="lazygit"
alias cd="z"
alias dlv="yt-dlp -f mp4 -P ~/Videos/ytdlp/"
alias dla="yt-dlp -f m4a -P ~/Videos/ytdlp/"
alias ws="watch sensors"
alias ff="fastfetch"

# One liners 
alias fn='nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" )'
alias fcd='cd $(fdfind . -td | fzf) && eza --icons'
alias fts='cd $(fdfind . -td | fzf) && tmux new-session'

# Remaps 
alias cat="bat"
alias tree="erd"
alias l="eza -l --icons"
alias ls="eza --icons"
alias la="eza -la --icons"

# Folder navigation 
alias cdn="z ~/.config/nvim/ && eza --icons"
alias cdl="z ~/Lab && eza --icons"
alias cdg="z ~/Lab/Git/ && eza --icons"
alias cdd="z ~/dotfiles/ && eza --icons"
alias cdy="z ~/Downloads/ytdlp && eza --icons"
alias cdo="z ~/Documents/'Obsidian Vault'/"

# TMUX
alias t="tmux"
alias ta="tmux attach"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tka="tmux kill-server && rm -rf ~/.local/share/tmux/ressurect"
alias tkss="tmux kill-session -t"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

fastfetch
