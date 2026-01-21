HISTFILE=~/.zsh_history
SAVEHIST=1000
HISTSIZE=1000

# Lines configured by zsh-newuser-install
unsetopt beep
set +o prompt_cr +o prompt_sp
# End of lines configured by zsh-newuser-install


#aliases
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq=xbps-query
alias drs=dbus-run-session
alias hw="dbus-run-session hyprland"
alias ls="ls --color=auto"
alias vim='nvim'

#plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#path
export PATH="$HOME/.local/bin/:$PATH"


#cat ~/.cache/wal/sequences

PROMPT=" %B%F{cyan}%n%f%b%B%F{green}@%f%b%B%F{yellow}%M%f%b%B[%b%B%F{cyan}%~%f%b%B]%b%B%F{yellow}$ %f%b"
