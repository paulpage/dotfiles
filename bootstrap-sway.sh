# ln -sf "$PWD/.zprofile" "$HOME/.zprofile"

mkdir -p "$HOME/.config/sway"
ln -sf "$PWD/.config/sway/config" "$HOME/.config/sway/config"

mkdir -p "$HOME/.config/foot"
ln -sf "$PWD/.config/foot/foot.ini" "$HOME/.config/foot/foot.ini"

mkdir -p "$HOME/.config/waybar"
ln -sf "$PWD/.config/waybar/config" "$HOME/.config/waybar/config"

sudo pacman -S bemenu bemenu-wayland foot waybar wl-clipboard swaylock swayidle
