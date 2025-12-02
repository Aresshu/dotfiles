#!/usr/bin/env bash

DOTFILES="${PWD}"
CONFIG_HOME="${HOME}/.config"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

link_group() {
	local src=$1 dest=$2

	if [ ! -d "$dest" ]; then
		echo "Creating $dest..."
		mkdir -p "$dest"
	fi

	find "$src" -mindepth 1 -maxdepth 1 2>/dev/null | while IFS= read -r file; do
		local base=${file##*/}
		local target="${dest}/${base}"
		
		if [ -L "$target" ] && [ "$(readlink "$target")" = "$file" ]; then
			printf "%bAlready linked%b: ~%s\n" "$GREEN" "$NC" "${target#"$HOME"}"
		elif [ -e "$target" ] || [ -L "$target" ]; then
			printf "%bSkipping ~%s – exists.%b\n" "$RED" "${target#"$HOME"}" "$NC"
		else
			printf "%bCreating symlink%b: %s -> %s\n" "$GREEN" "$NC" "$file" "$target"
			if ln -s "$file" "$target"; then
				printf "%bSymlink created.%b\n" "$GREEN" "$NC"
			else
				printf "%bERROR: Failed to symlink.%b\n" "$RED" "$NC"
			fi
		fi
	done
}

main(){
	case "${1:-}" in
		link)
			link_group "$DOTFILES/config" "$CONFIG_HOME"
			link_group "$DOTFILES/zsh" "$HOME"
			;;
		*)
			echo "Usage: $0 link"
			echo
			echo "Commands:"
			echo "	link	Create symlinks."
			exit 1
			;;
		esac
}

main "$@"
