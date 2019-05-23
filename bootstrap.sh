#!/bin/sh

dir="$(pwd)"

backup_dir="$HOME/dotfiles_backup_$(date +'%Y-%m-%d_%H:%M:%S')"
mkdir -p "$backup_dir"

# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/sxhkd"
mkdir -p "$HOME/.config/vifm"

for file in \
	"bashrc" \
	".config/i3/config" \
	".config/nvim/init.vim" \
	".config/sxhkd/sxhkdrc" \
	".config/vifm/vifmrc" \
	".gitconfig" \
	".local/share/applications/img.desktop" \
	".local/share/applications/pdf.desktop" \
	".local/share/applications/text.desktop" \
	".profile" \
	".xinitrc"; \
do
	[ -f "$HOME/$file" ] && cp "$HOME/$file" "$backup_dir"
	ln -sf "$dir/$file" "$HOME/$file"
done
