# ~/.zshenv

# Tie the PATH environment variable to the path array and enforce uniqueness
typeset -U PATH path

# Append custom script directories
path=("$HOME/.local/bin" $path)

export PATH

