#!/usr/bin/env zsh

DOTFILES="${PWD}"
CONFIG_HOME="${HOME}/.config"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

link(){
  if [ ! -d "${CONFIG_HOME}" ]; then
    echo "Creating ${CONFIG_HOME} directory..."
    mkdir -p "${CONFIG_HOME}"
  fi

  #.config files
  find "${DOTFILES}/config" -maxdepth 1 -mindepth 1 2>/dev/null | while IFS= read -r file;
  do
    target="${CONFIG_HOME}/$(basename "$file")"
    if [ -e "${target}" ] || [ -L "${target}" ]; then
      echo "${RED}Skipping ~${target#"$HOME"} already exists or is a symlink.${NC}"
      continue
    fi

    echo "${GREEN}Creating symlink${NC}: ${file} -> ${target}"
    if ln -s "${file}" "${target}"; then
      echo "${GREEN}Symlink created successfully.${NC}"
    else
      echo "${RED}ERROR: Failed to create symlink for ${file}${NC}"
    fi
  done

  #ZSH files
  find "${DOTFILES}/zsh" -maxdepth 1 -mindepth 1 2>/dev/null | while IFS= read -r file;
  do
    target="${HOME}/$(basename "$file")"
    if [ -e "${target}" ] || [ -L "${target}" ]; then
      echo "${RED}Skipping ~${target#"$HOME"} already exists or is a symlink.${NC}"
      continue
    fi

    echo "${GREEN}Creating symlink${NC}: ${file} -> ${target}"
    if ln -s "${file}" "${target}"; then
      echo "${GREEN}Symlink created successfully.${NC}"
    else
      echo "${RED}ERROR: Failed to create symlink for ${file}${NC}"
    fi
  done

  #Git files
  find "${DOTFILES}/git" -maxdepth 1 -mindepth 1 2>/dev/null | while IFS= read -r file;
  do
    target="${HOME}/$(basename "$file")"
    if [ -e "${target}" ] || [ -L "${target}" ]; then
      echo "${RED}Skipping ~${target#"$HOME"} already exists or is a symlink.${NC}"
      continue
    fi

    echo "${GREEN}Creating symlink${NC}: ${file} -> ${target}"
    if ln -s "${file}" "${target}"; then
      echo "${GREEN}Symlink created successfully.${NC}"
    else
      echo "${RED}ERROR: Failed to create symlink for ${file}${NC}"
    fi
  done

}

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <command>"
  echo "Available commands: link"
  exit 1
fi 

case "$1" in
  link)
    link
    ;;
  *)
    echo "Error: Unknown command '$1'"
    ;;
esac
