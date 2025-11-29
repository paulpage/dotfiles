# #!/bin/sh set -euo pipefail
#
sudo pacman -S --noconfirm git neovim openssh zsh man-db acpi ripgrep unzip rsync gvfs base-devel
# sudo pacman -S --noconfirm hyprland waybar wl-clipboard xdg-utils nwg-look
# sudo pacman -S --noconfirm imv zathura zathura-pdf-mupdf mupdf tesseract-data-eng mpv
# sudo pacman -S --noconfirm ttf-dejavu noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-linux-libertine otf-font-awesome
#
# sudo pacman -S --noconfirm firefox pcmanfm foot wofi
#
# sudo systemctl enable --now getty@tty2.service
# sudo systemctl enable --now getty@tty3.service
# sudo systemctl enable --now getty@tty4.service
# sudo systemctl enable --now getty@tty5.service


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

bootstrap-nvim
bootstrap-zsh
bootstrap-hypr

bootstrap .local/bin/scripts
