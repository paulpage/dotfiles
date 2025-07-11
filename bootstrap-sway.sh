# ln -sf "$PWD/.zprofile" "$HOME/.zprofile"

mkdir -p "$HOME/.config/sway"
ln -sf "$PWD/.config/sway/config" "$HOME/.config/sway/config"

mkdir -p "$HOME/.config/foot"
ln -sf "$PWD/.config/foot/foot.ini" "$HOME/.config/foot/foot.ini"

mkdir -p "$HOME/.config/waybar"
ln -sf "$PWD/.config/waybar/config" "$HOME/.config/waybar/config"

ln -sf "$PWD/.config/mimeapps.list" "$HOME/.config/mimeapps.list"

mkdir -p "$HOME/.local/share/applications"
for f in $(ls .local/share/applications/*); do
    ln -sf "$PWD/$f" "$HOME/$f"
done

sudo pacman -S $(cat arch_packages_sway.txt)
