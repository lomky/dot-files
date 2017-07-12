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

# Get the machine tweaks - always last
if [ -f ~/.bashrc_tweaks ]; then 
    . ~/.bashrc_tweaks
fi

