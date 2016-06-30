# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then                                                                                                         . ~/.bashrc
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
  export PATH
fi

if $(screen -ls | grep -q pts); then  screen -x; else screen -R; fi
