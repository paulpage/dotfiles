#!/bin/sh

set -euo pipefail

requested_progs=$(awk 'NF && !/^[[:space:]]*#/{print $2}' arch_programs.tsv)
present_progs=$(pacman -Qqe)
needed_progs=$(
  comm -23 \
    <(printf '%s\n' "$requested_progs" | sort -u) \
    <(printf '%s\n' "$present_progs" | sort -u)
)
if [ -n "$needed_progs" ]; then
    sudo pacman -S --noconfirm $needed_progs
fi

# for n in {2..5}; do
#     svc="getty@tty${n}.service"
#     if ! systemctl is-enabled --quiet "$svc"; then
#         sudo systemctl enable --now "$svc"
#     fi
# done

bootstrap() {
	mkdir -p "$HOME/$(dirname $1)"
	ln -sf "$PWD/$1" "$HOME/$1"
}

bootstrap-zsh() {
	bootstrap .zshrc
    if [ "$SHELL" != "$(which zsh)" ]; then
		chsh -s "$(which zsh)" "$USER"
	else
		echo "Already using zsh"
	fi
}

bootstrap-hypr() {
    bootstrap .config/hypr/hyprland.conf
    bootstrap .config/hypr/hyprpaper.conf
    bootstrap .config/hypr/hyprlock.conf
    bootstrap .config/waybar/config
    bootstrap .config/waybar/style.css
}

bootstrap-nvim() {
	bootstrap .config/nvim/init.lua
	PAQ_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/paqs/start/paq-nvim"
	if [ -d "$PAQ_PATH" ]; then
		echo "Neovim already bootstrapped"
	else
		git clone --depth=1 https://github.com/savq/paq-nvim.git "$PAQ_PATH"
		nvim +PaqInstall +qall
	fi
}

mkdir -p "$HOME/s" "$HOME/.ssh"

KEY_PATH="$HOME/.ssh/id_ed25519"
if [[ -f "$KEY_PATH" ]]; then
	echo "SSH key already exists"
else
	read -p "Enter your email address for git/ssh: " email
	ssh-keygen -t ed25519 -f "$KEY_PATH" -C "$email" -N ""
	echo "SSH key generated: $KEY_PATH"
fi

bootstrap .config/fontconfig/fonts.conf
bootstrap .config/foot/foot.ini
bootstrap .config/git/config
bootstrap .config/gdb/gdbinit
bootstrap .config/git/config
bootstrap .config/sway/config

bootstrap-nvim
bootstrap-zsh
bootstrap-hypr

bootstrap .local/bin/scripts

# TODO could have a command here that sets our own remote origin to the ssh version of the URL
