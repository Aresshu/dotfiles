ziguse(){
    if [ "$1" = "list" ]; then
        echo "Available Zig versions:"
        ls "$HOME/.zig/"
        return
    fi

    ZIGDIR="$HOME/.zig/$1"
    if [ -d "$ZIGDIR" ]; then
        echo "$1" > "$HOME/.zig/.zig-version"
        PATH=$(echo "$PATH" | tr ':' '\n' | grep -v "$HOME/.zig/" | tr '\n' ':' | sed 's/:$//')
        export PATH="$ZIGDIR:$PATH"
        xattr -d com.apple.quarantine "$ZIGDIR/zig" 2>/dev/null
        echo "Switched to Zig version $1"
        echo "Using: $(which zig)"
        zig version
    else 
        echo "Zig version $1 not found in $HOME/.zig/"
    fi

}
