dir=$(pwd)
olddir=~/dotfiles_old

cd ~
echo "Creating $olddir to backup old dotfiles..."
mkdir -p $olddir

mv $HOME/.bashrc $olddir
mv $HOME/.config/nvim/init.vim $olddir
mv $HOME/.gitconfig $olddir

echo "Done."

echo

mkdir -p $HOME/.config/nvim/autoload
cd $HOME/.config/nvim/autoload
curl -LO https://github.com/junegunn/vim-plug/raw/master/plug.vim

ln -sf $dir/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $dir/bashrc $HOME/.bashrc
ln -sf $dir/gitconfig $HOME/.gitconfig
