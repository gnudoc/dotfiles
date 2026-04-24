# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacsclient -c'
  export SUDO_EDITOR='visudo-emacs'
fi

eval $(keychain --eval --quiet id_ed25519 id_ed25519_backups id_ed25519_github)

alias btc="bluetoothctl"
alias proxsh="ssh -D 1080 ssh-nas-tunnel"

## ------------------------------------------------
## Quickly get tmux session on a remote server
## ------------------------------------------------

tm() {
    ssh -t "$1" "tmux new-session -A -s main"
}

## ------------------------------------------------


