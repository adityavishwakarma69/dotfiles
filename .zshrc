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

#weird ass curl shit
defination () {
  if [ -z $1 ]
  then
    echo "no word provided"
    return 1
  fi
  curl "dict.org/d:${1}"
}

#plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#path
export PATH="$HOME/.local/bin/:$PATH"


#cat ~/.cache/wal/sequences

if [ $TERM = "foot" ]
then
  PROMPT="%F{cyan}┏(%~)━%B%F{yellow}[%f%b%B%F{magenta}%n%f%b%B%F{red}@%f%b%B%F{cyan}%m%f%b%B%F{yellow}]%f%b%F{cyan}━[%D]━[%T]
%F{cyan}┗━(%F{magenta}%?%F{magenta}) "
  chafa ~/Pictures/ily/ayaka.png -s 24x24
  alias clear="clear;chafa ~/Pictures/ily/ayaka.png -s 24x24"
else
  PROMPT="%B%F{yellow}%n%f%b%B%F{blue}@%f%b%B%F{cyan}%m%f%b%B%F{yellow}$%f%b "
fi
