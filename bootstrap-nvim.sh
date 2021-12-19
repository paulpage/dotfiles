curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
nvim +PlugInstall +qall
