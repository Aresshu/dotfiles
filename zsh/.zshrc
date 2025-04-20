alias ls='lsd'

source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "$HOME/.zig/ziguse.sh" ]; then
    source "$HOME/.zig/ziguse.sh"
fi

if [ -f "$HOME/.zig/.zig-version" ]; then
    ZIGVER=$(cat "$HOME/.zig/.zig-version")
    ZIGDIR="$HOME/.zig/$ZIGVER"
    if [ -d "$ZIGDIR" ]; then
        export PATH="$ZIGDIR:$PATH"
        xattr -d com.apple.quarantine "$ZIGDIR/zig" 2>/dev/null
    fi
fi
