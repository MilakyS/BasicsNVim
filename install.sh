#!/usr/bin/env bash
set -e

echo "                                                                                                                  ";
echo "                                                                                                                  ";
echo "█████▄  ▄▄▄   ▄▄▄▄ ▄▄  ▄▄▄▄  ▄▄▄▄ ███  ██ ██  ██ ▄▄ ▄▄   ▄▄   ██ ▄▄  ▄▄  ▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄  ▄▄    ▄▄    ▄▄▄▄▄ ▄▄▄▄  ";
echo "██▄▄██ ██▀██ ███▄▄ ██ ██▀▀▀ ███▄▄ ██ ▀▄██ ██▄▄██ ██ ██▀▄▀██   ██ ███▄██ ███▄▄   ██  ██▀██ ██    ██    ██▄▄  ██▄█▄ ";
echo "██▄▄█▀ ██▀██ ▄▄██▀ ██ ▀████ ▄▄██▀ ██   ██  ▀██▀  ██ ██   ██   ██ ██ ▀██ ▄▄██▀   ██  ██▀██ ██▄▄▄ ██▄▄▄ ██▄▄▄ ██ ██ ";
echo "                                                                                                                  ";

CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim_backups"
if [ -d $CONFIG_DIR ]; then
	echo "NVim config directory founded"
	read -p "Do you want [B]ackup your files, [D]elete or [C]ancel : " answer
	case "$answer" in
		[Bb]*)
			mkdir -p "$BACKUP_DIR"
			mv "$CONFIG_DIR" "$BACKUP_DIR/nvim$(date +%s)"
			echo "Backup moved to $BACKUP_DIR"
			echo "Cloning BasicsNVim..."
			git clone https://github.com/MilakyS/BasicsNVim.git "$CONFIG_DIR"

			echo "Installing plugins..."
			nvim --headless +Lazy! +qa

			echo "BasicsNVim installed successfully!"
			echo "Thanks for installing my config :>"
			;;
		[Cc]*)
			echo "Installation cancelled"
			exit 0
			;;
		[Dd]*)
			echo "Deleting old config..."
			sleep 7	
			rm -rf "$CONFIG_DIR"
			echo "$CONFIG_DIR Removed"
			echo "Cloning BasicsNVim..."
			git clone https://github.com/MilakyS/BasicsNVim.git "$CONFIG_DIR"

			echo "Installing plugins..."
			nvim --headless +Lazy! +qa

			echo "BasicsNVim installed successfully!"
			echo "Thanks for installing my config :>"
			;;
		esac
fi
