export PATH=$PATH:$HOME/.zig/0.14.0-dev.2571
export PATH="/opt/homebrew/Cellar/node@22/22.13.0/bin/:$PATH"
alias ls='lsd'

source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
