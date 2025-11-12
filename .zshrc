# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[yellow]%}%n@%{$fg[yellow]%}%M %{$fg[green]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

unsetopt BEEP

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

ZLE_REMOVE_SUFFIX_CHARS=""

# Readline/emacs style bindings
bindkey -e

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/scripts:/home/paul/.cargo/bin:$HOME/go/bin:$HOME/s/ext/odin"

alias vim=nvim
alias e=nvim
alias g=git
alias o=xdg-open
alias ls='ls --color=auto'
alias p="sudo pacman"

# Disable control flow
stty -ixon

export FZF_DEFAULT_COMMAND="fd ."

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Needed for Arch Linux pkg-config to recognize (e.g.) sdl3 install path
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
