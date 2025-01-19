export PATH="/opt/homebrew/Cellar/node@22/22.13.0/bin/:$PATH"
alias ls='lsd'
alias zigswitch="source ${HOME}/.zig/zigswitch.sh"

source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
