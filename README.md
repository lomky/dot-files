# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc  

## Clone to expected location & create branch

`git clone https://github.com/lomky/dot-files.git ~/.dot-files`  
`git checkout -b DESCRIPTIVE_MACHINE_NAME`  
`git push --set-upstream origin DESCRIPTIVE_MACHINE_NAME`  


## Structure

### Bash Files

**.bash_profile** - _aka run-at-login_  

UI machines:  
`ln -s ~/.dot-files/.bash_profile_local ~/.bash_profile`  

terminal machines:  
`ln -s ~/.dot-files/.bash_profile_remote ~/.bash_profile`  

Machine specific overrides should be placed in file `~/.bash_profile` after
creating a machine specific branch

**.bashrc** - _aka run on any terminal launch_  

All machines:  
`ln -s ~/.dot-files/.bashrc ~/`  
`ln -s ~/.dot-files/.bashrc_git ~/`  

Machine specific overrides should be placed in file `~/.bashrc` after
creating a machine specific branch


**.bash_aliases**  

All machines:  
`ln -s ~/.dot-files/.bash_aliases ~/`  

Machine specific overrides should be placed in file `~/.bash_aliases` after
creating a machine specific branch

### Vim files

`cd`  
`ln -s ~/.dot-files/.vim .`  
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
`ln -s ~/.dot-files/.vimrc .`  
`vim +PluginInstall +qall`  

Machine specific overrides should be placed in file `~/.vimrc` after
creating a machine specific branch

### Screen file

`cd`  
`ln -s ~/.dot-files/.screenrc .`  

Machine specific overrides should be placed in file `~/.screenrc` after
creating a machine specific branch


### User-level Git ignore

Unix machines:  
`cd`  
`git config --global core.excludesfile ~/.gitignore`  
`ln -s ~/.dot-files/.gitignore-nix`  

