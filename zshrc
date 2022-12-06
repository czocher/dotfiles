# Set the oh-my-zsh theme
ZSH_THEME="agnoster"

# Hide the PS1 user information when unnecessary
DEFAULT_USER="czocher"

# Plugin configuration for oh-my-zsh
plugins=(git gpg-agent pass web-search kate colored-man-pages virtualenvwrapper virtualenv)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias g++='g++ -Wall -Wextra -pedantic -std=c++14'
alias gcc='gcc -Wall -Wextra -pedantic'
alias vim='nvim'
alias python='ipython3'
alias gpg='gpg2'
alias restart_pcscd='sudo systemctl restart pcscd'

# Disable nbsp for Facebook
setxkbmap -option "nbsp:none"

# Configure command line tools to use English (has to be in zshrc)
export LC_MESSAGES='en_GB'

