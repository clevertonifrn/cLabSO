# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

PS1='\[\e[0;36m\]\A\[\e[m\] \W \[\e[0;31m\]\u\[\e[m\]@\[\033[01;32m\]${HOSTNAME:0:3}\[\033[00m\]\$ '

