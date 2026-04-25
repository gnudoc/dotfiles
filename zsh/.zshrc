HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob autopushd
setopt beep nomatch notify
bindkey -e
zstyle :compinstall filename '/home/nij/.zshrc'
################################################################
# extendedglob allows things like:
# ls *(.) lists only regular files
# ls *(/) lists only dirs
# ls *(m-1) lists files modified in the last day
# ls *(Lk+50) lists files larger than 50KB
# rm **/*.log(.m+7) recursively rm's regular .log files >7 days
################
# autocd allows you to just enter a dir to cd to it
################
# autopushd makes every cd command push to a stack
# and then cd - TAB displays it as a numbered list
################################################################


autoload -Uz compinit
compinit

# --- The arch packaged zsh plugins are configured in configuration.nix ---

# --- starship is automatically initialised on nix ---

# --- Vterm Integration ---
# After starship initialises
if [[ "$INSIDE_EMACS" = 'vterm' ]] && [[ -n ${EMACS_VTERM_PATH} ]]; then
    # Source the main vterm integration, which includes title AND directory tracking
    if [[ -f ${EMACS_VTERM_PATH}/etc/vterm.zsh ]]; then
        source ${EMACS_VTERM_PATH}/etc/vterm.zsh
    fi
    # Optional: Fix directory tracking if Starship overrides the precmd hook
    # vterm_printf "51;A$(pwd)"
fi

# --- Environment Variables ---
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
elif [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  export EDITOR='emacsclient'
else
  export EDITOR='emacsclient -c'
  export SUDO_EDITOR='visudo-emacs'
fi

# --- SSH & Authentication ---
eval $(keychain --eval --quiet id_ed25519)

# --- Aliases ---
alias btc="bluetoothctl"
alias proxsh="ssh -D 1080 ssh-nas-tunnel"

# Always use color and classify directories/links with symbols
alias ls='ls --color=auto -F'
# Long format, human-readable sizes (KB/MB/GB)
alias ll='ls -lh --color=auto -F'
# ll with -a
alias la='ls -lah --color=auto -F'
# Just hidden files and normal files, no long format
alias l='ls -A --color=auto -F'

# -R: Pass through ANSI color escape sequences (great for reading logs or git output)
# -i: Smart-case search (lowercase searches are case-insensitive, uppercase is strict)
# -F: Automatically exit if the entire file fits on one screen
# -X: Prevent clearing the screen when exiting
alias less='less -RiFX'

alias wget='wget -c'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

### --- CLEVER aliases --- ###
# --- global aliases can be used within a command, not just at the start ---
# e.g. cat my_long_script.sh G "error" L
alias -g G="| grep"
alias -g L="| less"

# --- suffix aliases automatically assign a program to a file suffix
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  # Open a file in the current Emacs window 
  alias ff='vterm_cmd find-file'
  # Open dired in the current directory
  alias vd='vterm_cmd dired "$(pwd)"'
  # Launch magit-status for the current repo
  alias mag='vterm_cmd magit-status "$(pwd)"'
  # Open in the current Emacs session without creating a new frame
  alias -s org='emacsclient -n'
  alias -s txt='emacsclient -n'
  alias -s md='emacsclient -n'
else
  # Create a new frame when not using emacs
  alias -s org='emacsclient -c'
  alias -s txt='emacsclient -c'
  alias -s md='emacsclient -c'
fi
### --- --- ###

# --- command-line-editor ---
# C-x C-e to send a complex line to a $EDITOR buffer which can then
# be edited, saved and closed to return to the terminal line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line
