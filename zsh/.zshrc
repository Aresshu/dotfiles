alias ls='lsd'

source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
