# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhist
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -e

#setopt shwordsplit
SYST=$(uname)
if [[ "$SYST" = "Linux" ]]; then
  alias ls="ls --color=auto -B -F --group-directories-first"
elif [[ "$SYST" = "FreeBSD" ]]; then
  alias ls="ls -F -G"
elif [[ "$SYST" = "OpenBSD" ]]; then
  alias ls="ls -F"
fi
alias l="ls"
alias uxterm='uxterm -fa monospace:pixelsize=12'

alias pasteit="curl -F 'sprunge=<-' http://sprunge.us"

export TERM=xterm-256color
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c"
GPG_TTY=$(tty)
export GPG_TTY

# Setup the privoxy. w3m is _very_ fuzzy about the format of this, every other
# program will accept 127.0.0.1:8118 but w3m just won't.
export http_proxy=http://localhost:8118
export HTTP_PROXY=$http_proxy
export https_proxy=$http_proxy
export HTTPS_PROXY=$http_proxy
export no_proxy="localhost,127.0.0.1"

alias emacs='emacsclient -c'

alias mc='mc -b'

alias susp='systemctl suspend'

if [[ "$SYST" = "OpenBSD" ]]; then
  export AUTOCONF_VERSION=2.69
  export AUTOMAKE_VERSION=1.15
fi

#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
