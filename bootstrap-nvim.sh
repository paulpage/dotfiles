curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/.config/nvim/init.lua" "$HOME/.config/nvim/init.lua"
nvim +PlugInstall +qall
