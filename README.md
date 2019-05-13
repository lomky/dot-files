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
`ln -s ~/.dot-files/bash/.bash_profile_local ~/.bash_profile`  

terminal machines:  
`ln -s ~/.dot-files/bash/.bash_profile_remote ~/.bash_profile`  

Machine specific overrides should be placed in file `~/.bash_profile` after
creating a machine specific branch

**.bashrc** - _aka run on any terminal launch_  

All machines:  
`ln -s ~/.dot-files/bash/.bashrc ~/`  
`ln -s ~/.dot-files/bash/.bashrc_git ~/`  

Machine specific overrides should be placed in file `~/.bashrc` after
creating a machine specific branch


**.bash_aliases**  

All machines:  
`ln -s ~/.dot-files/bash/.bash_aliases ~/`  

Machine specific overrides should be placed in file `~/.bash_aliases` after
creating a machine specific branch

### Vim files

`cd`  
`ln -s ~/.dot-files/vim/.vim .`  
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
`ln -s ~/.dot-files/vim/.vimrc .`  
`vim +PluginInstall +qall`  

Machine specific overrides should be placed in file `~/.vimrc` after
creating a machine specific branch

### Screen file

`cd`  
`ln -s ~/.dot-files/screen/.screenrc .`  

Machine specific overrides should be placed in file `~/.screenrc` after
creating a machine specific branch

### Set Git configs

Set editor, user, and email
`git config --global core.editor "vim"`  
`git config --global user.email "email@example.com"`  
`git config --global user.name "Kat Tipton"`  

Set aliases for a nice history log and to cleanup local merged branches
`git config --global alias.hist "log --graph --full-history --all --no-merges --pretty=format:'%Cred%h%Creset %ad %s %C(green)%d%Creset %C(bold blue)<%an>%Creset' --date=short"`  
`git config --global alias.cleanup "git config alias checkout master && git branch --merged | grep -v '\\*\\|master\\|development' | xargs -r -n 1 git branch -d && git checkout -"`  

### User-level Git ignore

Unix machines:  
`cd`  
`git config --global core.excludesfile ~/.gitignore`  
`ln -s ~/.dot-files/git/.gitignore-nix`

### Ask Git to stash my credentials

Unix machines:  
`git config --global credential.helper cache`  
`git config --global credential.helper 'cache --timeout=3600'`  

Mac:  
`git credential-osxkeychain`  
`git config --global credential.helper osxkeychain`  

### Improve the quality of fortunes

Unix machines:  
`cd /usr/share/games/fortune`
`sudo tar xzvf ~/.dot-files/fortune_collection.tar.gz`  

# Version

1.0.1  

## Version History

## 1.0.0 - 2019-03
Began tracking version
