dir=~/dotfiles
olddir=~/dotfiles_old

cd ~
echo "Creating $olddir to backup old dotfiles..."
mkdir -p $olddir

mv ~/.vimrc $olddir/vimrc
mv ~/.vim $olddir/vim
mv ~/.Xresources $olddir/Xresources
mv ~/.conky $olddir/conky

echo "Done."

echo

mkdir -p .vim

echo "Symlinking new dotfiles..."
ln -s $dir/tmux.conf ~/.tmux.conf
ln -s $dir/vim/vimrc ~/.vimrc
ln -s $dir/Xresources ~/.Xresources
ln -s $dir/vim/snippets ~/.vim/snippets
ln -s $dir/conky ~/.conky
echo "Done."

read -p "Use config files for i3? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Backing up old files..."
	mv ~/.config/i3/config $olddir/i3_config
	mv ~/.xinitrc $olddir/xinitrc
	echo "Done."

	echo "Symlinking new dotfiles..."
	ln -s $dir/i3/config ~/.config/i3/config
	ln -s $dir/i3/xinitrc ~/.xinitrc
	echo "Done."
fi

echo "Bootstrapping vim..."
cd ~/.vim
mkdir bundle
cd bundle
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall
echo "Done."
