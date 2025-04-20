#!/usr/bin/env bash

DOTFILES="${PWD}"
CONFIG_HOME="${HOME}/.config"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

link_group() {
  local src=$1 dest=$2
  [ ! -d "$dest" ] && echo "Creating $dest..." && mkdir -p "$dest"

  find "$src" -mindepth 1 -maxdepth 1 2>/dev/null | while IFS= read -r file; do
    local base=$(basename "$file")
    local target="${dest}/${base}"

    if [ -e "$target" ] || [ -L "$target" ]; then
      echo -e "${RED}Skipping ~${target#"$HOME"} already exists or is a symlink.${NC}"
    else
      echo -e "${GREEN}Creating symlink${NC}: $file -> $target"
      ln -s "$file" "$target" && echo -e "${GREEN}Symlink created.${NC}" || echo -e "${RED}ERROR: Failed to symlink.${NC}"
    fi
  done
}

main() {
  case "$1" in
    link)
      link_group "$DOTFILES/config" "$CONFIG_HOME"
      link_group "$DOTFILES/zsh" "$HOME"
      link_group "$DOTFILES/git" "$HOME"
      ;;
    *)
      echo "Usage: $0 link"
      ;;
  esac
}

main "$@"
