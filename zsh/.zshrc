export PATH="/opt/homebrew/Cellar/node@22/22.13.0/bin/:$PATH"
alias ls='lsd'
alias zigswitch="source ${HOME}/.zig/zigswitch.sh"

source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Created by `pipx` on 2025-01-31 23:54:35
export PATH="$PATH:/Users/alesh/.local/bin"
