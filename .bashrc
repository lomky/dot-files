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

# Achieve wisdom
fortune | cowsay -f `ls /usr/share/cowsay/cows/ | shuf -n 1`

# Add machine specific tweaks here after creating a local machine branch

export PERL5LIB="$PERL5LIB:/home/ktipton/repos/gcis-pl-client/lib:/home/ktipton/repos/gcis/lib/:/home/ktipton/repos/gcis-scripts/lib/"
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
