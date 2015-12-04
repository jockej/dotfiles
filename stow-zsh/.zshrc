# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhist
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
setopt histignorealldups sharehistory
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

path+="$HOME/.scripts"

#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"



# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' original false
zstyle :compinstall filename '/home/joakimj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
