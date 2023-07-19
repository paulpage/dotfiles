export XDG_CONFIG_HOME="$HOME/.config"

export TERMINAL="st"
export READER="zathura"
export EDITOR="nvim"
export BROWSER="firefox"
export FILE="pcmanfm-qt"
export PAGER="less --mouse"

# export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export GTK_USE_PORTAL=1
export FZF_DEFAULT_COMMAND='fd --type file --hidden'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

[ -f "$HOME/.zshrc" ] && . "$HOME/.zshrc"

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

startx
