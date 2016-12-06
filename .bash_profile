# Basic terminal settings
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Run rbenv and add to path
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

# Use git autocompletion script if it exists
test -f ~/.git-completion.bash && . $_

# Bash aliases
alias reload!='source ~/.bash_profile'
