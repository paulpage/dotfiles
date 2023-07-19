./bootstrap-git.sh
./bootstrap-nvim.sh
./bootstrap-scripts.sh
./bootstrap-zsh.sh

ln -sf "$PWD/.profile" "$HOME/.zprofile"
ln -sf "$PWD/.xinitrc" "$HOME/.xinitrc"

mkdir -p "$HOME/.config/i3"
ln -sf "$PWD/.config/i3/config" "$HOME/.config/i3/config"

mkdir -p "$HOME/.config/sxhkd"
ln -sf "$PWD/.config/sxhkd/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"
