# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then 
    . ~/.bashrc
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
  export PATH
fi

# Set up history to work right with screen
shopt -s histappend

# Autolaunch the existing or a new screen session
if $(screen -ls | grep -q pts); then  screen -x; else screen -R; fi
