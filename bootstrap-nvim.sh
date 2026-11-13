paq_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/paqs/start/paq-nvim"
if [ ! -d "$paq_dir" ]; then
    git clone --depth=1 https://github.com/savq/paq-nvim.git "$paq_dir"
fi

# Link the whole nvim config folder. Move an existing real folder out of the way first.
nvim_dir="$HOME/.config/nvim"
if [ -d "$nvim_dir" ] && [ ! -L "$nvim_dir" ]; then
    mv "$nvim_dir" "$nvim_dir.bak.$(date +%s)"
fi
mkdir -p "$HOME/.config"
ln -sfn "$PWD/.config/nvim" "$nvim_dir"

nvim --headless -c 'autocmd User PaqDoneInstall quit' -c PaqInstall
