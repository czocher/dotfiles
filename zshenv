# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Configure restic
export RESTIC_PASSWORD_COMMAND='gopass show backup'
export RESTIC_REPOSITORY='sftp:czocher@10.0.0.10:/home/restic'

# Set XDG to defaults if not set
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME="$HOME/.cache"

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
export TZ=':/etc/localtime'

# Use the podman socket instead of docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# Disable Ryuk in testcontainers
export TESTCONTAINERS_RYUK_DISABLED='true'
