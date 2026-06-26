# Set the oh-my-zsh theme
ZSH_THEME="agnoster"

# Hide the PS1 user information when unnecessary
DEFAULT_USER="czocher"

# Configure the ssh-agent plugin
zstyle :omz:plugins:ssh-agent quiet yes identities id_ed25519_sk

# Better completion UX.
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Small quality-of-life options.
setopt INTERACTIVE_COMMENTS
setopt NO_FLOW_CONTROL

# Plugin configuration for oh-my-zsh
plugins=(git ssh-agent web-search kate colored-man-pages virtualenvwrapper virtualenv history-substring-search)

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

# Configure command line tools to use English (has to be in zshrc)
export LC_MESSAGES='en_GB'

# Show emoji box when in toolbox context
prompt_context() {
  if [[ -f /run/.containerenv && -f /run/.toolboxenv ]]; then
    prompt_segment black default '⛶'
  fi
}

# Configure CDPATH
cdpath=(
  "$HOME"
  "$HOME/Projekty"
)
