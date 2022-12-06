# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export GITAWAREPROMPT='~/.bash/git-aware-prompt'
source "${GITAWAREPROMPT}/main.sh"

# Set the PS1
PS1="\[\033[36m\][\[\033[m\]\[\033[1;33m\]\u@\h\[\033[m\] \[\033[32m\]\W\[\033[m\]\[\033[36m\]]\[\033[m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
fi
export GPG_TTY=`tty`

# Setup aliases
alias vim='nvim'
alias python='ipython3'
alias gpg='gpg2'
