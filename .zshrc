# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "zap-zsh/completions"

# export PATH
export PATH=$PATH:/home/raphael/.local/share/bob/nvim-bin
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# export environment variables 
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'

# Shortcuts
alias n="nvim"
alias nz="nvim ~/.zshrc"
alias ne="nix-env"
alias e="yazi"
alias gl="lazygit"
alias zj="zellij"
alias zjs="zellij --session"
alias dlv="yt-dlp -P ~/Videos/ytdlp/ --embed-chapters"
alias dla="yt-dlp -f m4a -P ~/Videos/ytdlp/"
alias ws="watch sensors"
alias ff="fastfetch"

# One liners 
alias fn='nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" )'
alias fcd='z $(fdfind . -td | fzf) && eza --icons'
alias zjr='zellij attach "$(zellij ls | sed '\''s/\x1b\[[0-9;]*m//g'\'' | awk '\''{print $1}'\'' | fzf)"'

# Remaps 
alias cat="bat"
alias cd="z"
alias l="eza -l --icons"
alias ls="eza --icons"
alias la="eza -la --icons"
alias t="erd -y inverted -H"
alias ta="erd -y inverted -H -. --no-git"
alias grep="rg"

# Folder navigation 
alias cdn="z ~/.config/nvim/ && eza --icons"
alias cdl="z ~/Lab && eza --icons"
alias cdg="z ~/Lab/Git/ && eza --icons"
alias cdd="z ~/Dev/dotfiles/ && eza --icons"
alias cdy="z ~/Downloads/ytdlp && eza --icons"
alias cdo="z ~/Documents/'Obsidian Vault'/"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

# if [[ -z "$ZELLIJ" ]]; then
#
#     choice=$(printf "resurrect_session\nhome_session\n.config_session\nroot_session" | fzf --prompt="Choose a command: ")
#
#     if [[ "$choice" == "home_session" ]]; then
#         fcd && zellij
#     elif [[ "$choice" == "resurrect_session" ]]; then
#         zjr
#     elif [[ "$choice" == ".config_session" ]]; then
#         cd ~/.config && fcd && zellij
#     elif [[ "$choice" == "root_session" ]]; then
#         cd / && fcd && zellij
#     else
#         echo "No valid selection made."
#     fi
# fi
#
fastfetch
