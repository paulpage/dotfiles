#!/bin/sh

cwd="$(pwd)"

backup_dir="$HOME/dotfiles_backup_$(date +'%Y-%m-%d_%H:%M:%S')"
mkdir -p "$backup_dir"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/sxhkd"
mkdir -p "$HOME/.config/vifm"
mkdir -p "$HOME/.config/fontconfig"
mkdir -p "$HOME/.config/bspwm"

for file in \
	".config/emoji" \
	".config/fontconfig/fonts.conf" \
	".config/nvim/init.vim" \
	".config/sxhkd/sxhkdrc" \
	".config/vifm/vifmrc" \
	".config/bspwm/bspwmrc" \
	".config/mimeapps.list" \
	".gitconfig" \
	".local/bin" \
	".local/share/applications/img.desktop" \
	".local/share/applications/pdf.desktop" \
	".local/share/applications/text.desktop" \
	".profile" \
	".xinitrc" \
	".Xresources" \
	".zshrc";
do
	[ -f "$HOME/$file" ] && cp "$HOME/$file" "$backup_dir"
	ln -sf "$cwd/$file" "$HOME/$file"
done

for dir in \
    ".local/bin";
do
    [ -d "$HOME/$dir" ] && cp -r "$HOME/$dir" "$backup_dir" || mkdir "$HOME/$dir"
    for file in $(ls "$cwd/$dir");
    do
        ln -sf "$cwd/$dir/$file" "$HOME/$dir/$file"
    done
done
