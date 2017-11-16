export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Basic terminal settings
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \[$bldpur\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Run rbenv and add to path
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv

# Use git autocompletion script if it exists
test -f ~/.git-completion.bash && . $_

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Additional PATHs
export PATH="$PATH:~/scripts:/usr/local/mysql/bin:~/bin:.bin"
export PATH="$PATH:`yarn global bin`"

#export EDITOR="subl -w"

# Bash aliases
alias reload!='source ~/.bash_profile'

# Script shortcuts
alias newscript="chmod u+rx ~/scripts/*.sh && reload!"

# Rails shortcuts
alias be="bundle exec"
alias dlog="tail -f log/development.log"
alias rs="bin/rails s"
alias fs="bin/foreman start"
alias rsp="bin/rspec"
alias rc="bin/rails c"
alias rcs="bin/rails c --sandbox"
alias rt="rails_test"
alias rr="bin/rails routes"

# Vagrant shortcuts
alias vu="vagrant up"
alias vr="vagrant reload"
alias vst="vagrant status"

# Heroku shortcuts
alias pt="heroku addons:open --app polar-plains-59453 papertrail"

# File formatting shortcuts
alias json="python -mjson.tool"

# Misc shortcuts
alias bfg="java -jar ~/Downloads/bfg-1.12.12.jar"

# Walk up arbitrary number of directories
function up()
{
  dir=""
  if [ -z "$1" ]; then
    dir=..
  elif [[ $1 =~ ^[0-9]+$ ]]; then
    x=0
    while [ $x -lt ${1:-1} ]; do
      dir=${dir}../
      x=$(($x+1))
    done
  else
    dir=${PWD%/$1/*}/$1
  fi
  cd "$dir";
}

function upstr()
{
    echo "$(up "$1" && pwd)";
}

function rails_test()
{
  type="model"
  if [ -z "$1" ]; then
    echo "Usage: rails_test model-name [test-name-regex]"
  else
    testfile="test/models/"$1"_test.rb"
    if [ -z "$2" ]; then
      ruby -Itest "$testfile"
    else
      ruby -Itest "$testfile" -n "/"$2"/"
    fi
  fi
}

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
