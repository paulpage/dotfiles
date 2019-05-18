#!/bin/sh

dir="$(pwd)"

backup_dir="$HOME/dotfiles_backup_$(date +'%Y-%m-%d_%H:%M:%S')"
mkdir -p "$backup_dir"



[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$backup_dir"
[ -f "$HOME/.config/i3" ] && cp "$HOME/.config/i3" "$backup_dir"
[ -f "$HOME/.config/nvim/init.vim" ] && cp "$HOME/.config/nvim/init.vim" "$backup_dir"
[ -f "$HOME/.gitconfig" ] && cp "$HOME/.gitconfig" "$backup_dir"
[ -f "$HOME/.local/share/applications/img.desktop" ] && cp "$HOME/.local/share/applications/img.desktop" "$backup_dir"
[ -f "$HOME/.local/share/applications/pdf.desktop" ] && cp "$HOME/.local/share/applications/pdf.desktop" "$backup_dir"
[ -f "$HOME/.local/share/applications/text.desktop" ] && cp "$HOME/.local/share/applications/text.desktop" "$backup_dir"
[ -f "$HOME/.profile" ] && cp "$HOME/.profile" "$backup_dir"
[ -f "$HOME/.xinitrc" ] && cp "$HOME/.xinitrc" "$backup_dir"

mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/nvim"

ln -sf "$dir/.bashrc" "$HOME/.bashrc"
ln -sf "$dir/.config/i3" "$HOME/.config/i3"
ln -sf "$dir/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$dir/.gitconfig" "$HOME/.gitconfig"
ln -sf "$dir/.local/share/applications/img.desktop" "$HOME/.local/share/applications/img.desktop"
ln -sf "$dir/.local/share/applications/pdf.desktop" "$HOME/.local/share/applications/pdf.desktop"
ln -sf "$dir/.local/share/applications/text.desktop" "$HOME/.local/share/applications/text.desktop"
ln -sf "$dir/.profile" "$HOME/.profile"
ln -sf "$dir/.xinitrc" "$HOME/.xinitrc"

mkdir -p "$HOME/.config/nvim/autoload"

#./programs_ubuntu.sh
#
#mkdir -p $HOME/src
#cd $HOME/src
#git clone https://github.com/paulpage/st
#cd st
#sudo make install
#
#cd $HOME
#echo "Creating $olddir to backup old dotfiles..."
#mkdir -p $olddir
#
#mv $HOME/.bashrc $olddir
#mv $HOME/.config/nvim/init.vim $olddir
#mv $HOME/.gitconfig $olddir
#
#mkdir -p $HOME/.config/nvim/autoload
#cd $HOME/.config/nvim/autoload
#git clone --depth 1 https://github.com/junegunn/vim-plug
#cp vim-plug/plug.vim .
#rm -rf vim-plug
#
#mkdir -p $HOME/.config/nvim
#ln -sf $dir/nvim/init.vim $HOME/.config/nvim/init.vim
#ln -sf $dir/bashrc $HOME/.bashrc
#ln -sf $dir/gitconfig $HOME/.gitconfig
