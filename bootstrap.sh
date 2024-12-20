#!/usr/bin/env  zsh

DOTFILES="$(pwd)"
CONFIG_HOME="${HOME}/.config"
BACKUP_DIR="${HOME}/.dotfiles_backup"

backup() {
  # Remove the existing backup directory, if it exists
  if [ -d "${BACKUP_DIR}" ]; then
    echo "Removing existing backup: ${BACKUP_DIR}"
    rm -rf "${BACKUP_DIR}"
  fi

  # Create a fresh backup directory
  echo "Creating backup directory at: ${BACKUP_DIR}"
  mkdir -p "${BACKUP_DIR}" 

#   Backup each folder within .config
#   I decided to backup .config as a whole
#   Left this commented out if needed in the future
#
#   for filename in ${CONFIG_HOME}/*; do
#     if [ -e "$filename" ] && [ ! -L "$filename" ]; then 
#       echo "Backing up file: $filename"
#       cp -rf "$filename" "$BACKUP_DIR"
#     else 
#       echo "SKIPPING: $filename does not exist or is a symlink"
#     fi
#   done

  # Back up the entire .config directory
  if [ -d "${CONFIG_HOME}" ]; then
    echo "Backing up ${CONFIG_HOME}"
    cp -a "${CONFIG_HOME}" "${BACKUP_DIR}/"
  else
    echo "WARNING: ${CONFIG_HOME} does not exist or is not a directory"
  fi

   # Back up .zshrc if it exists and is not a symlink
  if [ -e "${HOME}/.zshrc" ] && [ ! -L "${HOME}/.zshrc" ]; then
    echo "Backing up .zshrc"
    cp -rf "${HOME}/.zshrc" "${BACKUP_DIR}"
  else 
    echo "WARNING: ${HOME}/.zshrc does not exist or is a symlink"
  fi
}

link(){
  # Ensure the .config directory exists
  if [ ! -d "${CONFIG_HOME}" ]; then
    echo "Creating ${CONFIG_HOME}..." 
    mkdir -p "${CONFIG_HOME}"
  fi

  # Symlink each file from the dotfiles config directory to ~/.config
  find "$DOTFILES/config" -maxdepth 1 -mindepth 1 2>/dev/null | while IFS= read -r file; do
  target="${CONFIG_HOME}/$(basename "$file")"

    # Skip if the target already exists or is a symlink
    if [ -e "$target" ] || [ -L "$target" ]; then
      echo "~${target#"$HOME"} already exists or is a symlink. Skipping."
      continue
    fi

    # Create the symlink
    echo "Creating symlink: ${file} -> ${target}"
    if ln -s "$file" "$target"; then
      echo "Symlink created successfully."
    else
      echo "ERROR: Failed to create symlink for ${file}"
    fi
  done

  # Symlink .zshrc specifically
  if [ ! -e "${HOME}/.zshrc" ] && [ ! -L "${HOME}/.zshrc" ]; then
    echo "Creating symlink: ${DOTFILES}/.zshrc -> ${HOME}/.zshrc"
    ln -s "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
  else
    echo "${HOME}/.zshrc already exists or is a symlink... Skipping."
  fi

  # Symlink .gitconfig specifically
  if [ ! -e "${HOME}/.gitconfig" ] && [ ! -L "${HOME}/.gitconfig" ]; then
    echo "Creating symlink: ${DOTFILES}/.gitconfig -> ${HOME}/.gitconfig"
    ln -s "${DOTFILES}/.gitconfig" "${HOME}/.gitconfig"
  else
    echo "${HOME}/.gitconfig already exists or is a symlink... Skipping."
  fi
}

# Print usage if no arguments are provided
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <command>"
  echo "Available commands: backup | link"
  exit 1
fi

# Handle command-line arguments
case "$1" in
  backup)
    backup
    ;;
  link)
    link
    ;;
  *)
    echo "Error: Unknown command '$1'"
    echo "Available commands: backup | link"
    exit 1
    ;;
esac
