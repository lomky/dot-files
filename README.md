# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc

## Clone to expected location

`git clone https://github.com/lomky/dot-files.git ~/.dot-files`  

## Structure

### Bash Files

**.bash_profile** - _aka run-at-login_

UI machines:  
`ln -s ~/.dot-files/.bash_profile_base ~/.bash_profile_base`  
`ln -s ~/.dot-files/.bash_profile_local ~/.bash_profile`  

terminal machines:  
`ln -s ~/.dot-files/.bash_profile_base ~/.bash_profile_base`  
`ln -s ~/.dot-files/.bash_profile_remote ~/.bash_profile`  

Machine specific overrides should be placed in file `~/.bash_profile_tweaks`

**.bashrc** - _aka run on any terminal launch_

All machines:  
`ln -s ~/.dot-files/.bashrc ~/`  
`ln -s ~/.dot-files/.bashrc_git ~/`  

Machine specific overrides should go in file `~/.bashrc_tweaks`

**.bash_aliases** 

All machines:  
`ln -s ~/.dot-files/.bash_aliases ~/`  

Machine specific overrides should go in file `~/.bash_aliases_tweaks`

### Vim files

`cd`  
`ln -s ~/.dot-files/.vim .`  
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
`ln -s ~/.dot-files/.vimrc .`  

TODO: local overrides  
Unclear where there should go, given Vundles locale requirements.  
One for vundle, one for other?  

### Screen file

`cd`  
`ln -s ~/.dot-files/.screenrc .`  

Machine specific overrides should go in file `~/.screenrc_tweaks`  
