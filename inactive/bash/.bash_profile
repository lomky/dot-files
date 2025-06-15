# .bash_profile
# For the next time I forget:
# .bash_profile is run upon opening the terminal program
# .bashrc is run each time you start a shell.

# Get the aliases and functions
if [ -f ~/.bashrc ]; then 
    . ~/.bashrc
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
  export PATH
fi

#local tweaks
# Get the bash aliases
if [ -f ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi
