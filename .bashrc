# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Get the bashrc git functions
if [ -f ~/.bashrc_git ]; then 
    . ~/.bashrc_git
fi

export TZ="US/Eastern"
export PS1="\[\e[32m\]\d\[\e[m\] \[\e[32m\]\t\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\]\w \\$ "

# Get the bash aliases
if [ -f ~/.bash_aliases ]; then 
    . ~/.bash_aliases
fi

# Add machine specific tweaks here after creating a local machine branch

# TODO.txt configs
export TODOTXT_DEFAULT_ACTION=ls
alias t='/usr/local/bin/todo.sh'

# go config
export GOPATH='/Users/37580/goWork/'

#perlprew config
source ~/perl5/perlbrew/etc/bashrc

#rbenv config
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# local perl lib path
export PERL5LIB=$PERL5LIB':/Users/37580/repo/usgcrp/gcis/lib:/Users/37580/repo/usgcrp/gcis-scripts/lib:/Users/37580/repo/usgcrp/gcis-pl-client/lib'

# unknown
export GIT_HOME='/usr/local/Cellar/git/2.9.0/bin'
PATH=$GIT_HOME:$PATH

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
