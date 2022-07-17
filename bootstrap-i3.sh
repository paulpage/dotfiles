./bootstrap-git.sh
./bootstrap-nvim.sh
./bootstrap-scripts.sh
./bootstrap-zsh.sh

mkdir -p "$HOME/.config/i3"
ln -sf "$PWD/.config/i3/config" "$HOME/.config/i3/config"

ln -sf "$PWD/.xinitrc" "$HOME/.xinitrc"
