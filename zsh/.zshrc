# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joakim/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#setopt shwordsplit
alias ls="ls --color=auto -B -F --group-directories-first"
alias l="ls"
alias uxterm='uxterm -fa monospace:pixelsize=12'

alias pasteit="curl -F 'sprunge=<-' http://sprunge.us"

#path+=/home/joakim/bin/
export TERM=xterm-256color
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c"
GPG_TTY=$(tty)
export GPG_TTY


alias emacs='emacsclient -c'
alias chname='xprop -id $WINDOWID -set WM_NAME'

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
