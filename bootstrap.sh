dir=$(pwd)
olddir=$HOME/dotfiles_old

./programs_ubuntu.sh

mkdir -p $HOME/src
cd $HOME/src
git clone https://github.com/paulpage/st
cd st
sudo make install

cd $HOME
echo "Creating $olddir to backup old dotfiles..."
mkdir -p $olddir

mv $HOME/.bashrc $olddir
mv $HOME/.config/nvim/init.vim $olddir
mv $HOME/.gitconfig $olddir

mkdir -p $HOME/.config/nvim/autoload
cd $HOME/.config/nvim/autoload
git clone --depth 1 https://github.com/junegunn/vim-plug
cp vim-plug/plug.vim .
rm -rf vim-plug

mkdir -p $HOME/.config/nvim
ln -sf $dir/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $dir/bashrc $HOME/.bashrc
ln -sf $dir/gitconfig $HOME/.gitconfig

mkdir -p $HOME/boxes
