# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/eww/target/release:$PATH"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# source /share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


# use FZF
eval "$(fzf --zsh)"
# use the fuck
eval "$(thefuck --alias fuck)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls="eza --color=always --long --git --no-permissions --icons=always"
alias speed="speedtest-cli"
alias spot="ncspot"
alias y="yazi"
#desmonta el que le pase por argumento
alias umountusb='udisksctl unmount -b'

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# change cd to Z using zoxide
eval "$(zoxide init zsh)"

# run neofetch on launch
neofetch

eval $(thefuck --alias)
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/nvm/init-nvm.sh

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
#para mpd y rmpc(reproductor de musica)
export MPD_HOST="$XDG_RUNTIME_DIR/mpd/socket"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Created by `pipx` on 2025-07-03 02:31:30
export PATH="$PATH:/home/eve/.local/bin"

# Guarda el historial inmediatamente (no esperar a cerrar sesión)
setopt inc_append_history

# Lee y sincroniza el historial después de cada comando
setopt share_history

# Evita duplicados en el historial
setopt hist_ignore_dups

# Ignorar líneas en blanco en historial
setopt hist_ignore_all_dups

# Guarda el historial entre sesiones
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
