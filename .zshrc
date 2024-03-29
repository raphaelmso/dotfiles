# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "zap-zsh/completions"

# export
export ANDROID_HOME=/home/raphael/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/platform-tools
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

# functions
cdls() {
    cd "$1" && eza --icons 
}

# Shortcuts
alias n="nvim"
alias fn='nvim $(fzf)'
alias fc='cd $(fdfind . -td | fzf) && eza --icons'
alias fts='cd $(fdfind . -td | fzf) && tmux new-session'
alias dl="yt-dlp"
alias dlv="yt-dlp -P ~/Videos/Downloads/ -f mp4"

# Remaps 
alias cat="batcat"
alias l="eza -l --icons"
alias ls="eza --icons"
alias la="eza -a --icons"

# Folder navigation 
alias cs='cdls'
alias cdn="cd ~/.config/nvim/ && eza --icons"
alias cdp="cd ~/Programming && eza --icons"
alias cdg="cd ~/Programming/Git/ && eza --icons"
alias cdd="cd ~/dotfiles/ && eza --icons"
alias cdr="cd ~/Programming/Random-Projects/ && eza --icons"
alias cdt="cd ~/Programming/Random-Projects/Tests/ && eza --icons"

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

# Git
alias g="git"
alias gs="git status"


# Load and initialise completion system
autoload -Uz compinit
compinit

# fnm
export PATH="/home/raphael/.local/share/fnm:$PATH"
eval "`fnm env`"
