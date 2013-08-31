# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PATH=$PATH:/opt/callibre
export PATH

alias gcc='gcc -Wall -Wextra -pedantic'
alias vim='vimx'
alias python3='ipython3'
alias python='ipython3'

ponysay --quote luna
