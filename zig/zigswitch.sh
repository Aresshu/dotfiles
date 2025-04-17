#!/usr/bin/env zsh
# A script that allows you to switch between zig versions.
# This works with a zig directory within HOME/.zig
# I usually rename the zig version directory as such
#   Example: 0.14.0-dev.2837
# This script removes all mentions of zig from PATH and
# adds the mentioned directory to PATH.
# Within .zshrc I also have an alias as you need to source this script.

if [ -d "$HOME/.zig/$1" ]; then
  PATH=$(echo $PATH | tr ':' '\n' | grep -v "/.zig/" | tr '\n' ':' | sed 's/:$//')
  export PATH="$HOME/.zig/$1:$PATH"
  xattr -d com.apple.quarantine "$HOME/.zig/$1/zig" 2>/dev/null
  echo "Switched to Zig version $1"
else 
  echo "Zig version $1 not found in $HOME/.zig/"
fi
