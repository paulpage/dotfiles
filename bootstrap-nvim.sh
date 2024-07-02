git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/.config/nvim/init.lua" "$HOME/.config/nvim/init.lua"
nvim +PaqInstall +qall
