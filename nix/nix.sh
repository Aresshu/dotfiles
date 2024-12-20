#!/usr/bin/env zsh

# Define variables for paths
DOTFILES="$(pwd)" 
CONFIG_HOME="${HOME}/.config" 

# Setup function to copy nix-related folders
copy() {
  # Check if nix and nix-darwin directories already exist in ~/.config
  if [ ! -d "${CONFIG_HOME}/nix" ] && [ ! -d "${CONFIG_HOME}/nix-darwin" ]; then
    echo "Adding ${DOTFILES}/nix/nix and ${DOTFILES}/nix/nix-darwin to ${CONFIG_HOME}"

    # Copy nix and nix-darwin directories
    cp -a "${DOTFILES}/nix/nix" "${CONFIG_HOME}/" || { echo "ERROR: Failed to copy nix"; exit 1; }
    cp -a "${DOTFILES}/nix/nix-darwin" "${CONFIG_HOME}/" || { echo "ERROR: Failed to copy nix-darwin"; exit 1; }

    echo "Setup completed successfully!"
  else
    echo "ERROR: One or both directories (${CONFIG_HOME}/nix or ${CONFIG_HOME}/nix-darwin) already exist!"
    exit 1
  fi
}

# Validate arguments and run the appropriate command
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <command>"
  echo "Available commands: copy"
  exit 1
fi

case "$1" in
  copy)
    copy
    ;;
  *)
    echo "Error: Unknown command '$1'"
    echo "Available commands: copy"
    exit 1
    ;;
esac

