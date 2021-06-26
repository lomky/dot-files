# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc  

## Structure

### Bash Files

**.bash_profile** - _aka run-at-login_  

UI machines:  
`ln -s ~/.dot-files/bash/.bash_profile_local ~/.bash_profile`  

terminal machines:  
`ln -s ~/.dot-files/bash/.bash_profile_remote ~/.bash_profile`  

Machine specific overrides should be placed in file `~/.bash_profile_local`

**.bashrc** - _aka run on any terminal launch_  

All machines:  
`ln -s ~/.dot-files/bash/.bashrc ~/`  
`ln -s ~/.dot-files/bash/.bashrc_git ~/`  

Machine specific overrides should be placed in file `~/.bashrc_local`


**.bash_aliases**  

All machines:  
`ln -s ~/.dot-files/bash/.bash_aliases ~/`  

Machine specific overrides should be placed in file `~/.bash_aliases_local`

### Vim files

`cd`  
`ln -s ~/.dot-files/vim/.vim .`  
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
`ln -s ~/.dot-files/vim/.vimrc .`  
`vim +PluginInstall +qall`  

Machine specific overrides aren't well handled ¯\_(ツ)_/¯

### Screen file

`cd`  
`ln -s ~/.dot-files/screen/.screenrc .`  

Machine specific overrides should be placed in file `~/.screenrc_local`

### Git
#### Set Git configs

Set editor, user, and email. In this house we use `main`  
`git config --global core.editor "vim"`  
`git config --global user.email "email@example.com"`  
`git config --global user.name "Kat Tipton"`  
`git config --global init.defaultBranch main`  

Set aliases for a nice history log and to cleanup local merged branches  
`git config --global alias.hist "log --graph --full-history --all --no-merges --pretty=format:'%Cred%h%Creset %ad %s %C(green)%d%Creset %C(bold blue)<%an>%Creset' --date=short"`  
`git config --global alias.cleanup "git config alias checkout master && git branch --merged | grep -v '\\*\\|master\\|development' | xargs -r -n 1 git branch -d && git checkout -"`  
`git config --global alias.pub = "!git push -u origin $(git branch-name)"`  

#### User-level Git ignore

Unix machines:  
`cd`  
`git config --global core.excludesfile ~/.gitignore`  
`ln -s ~/.dot-files/git/.gitignore-nix`

#### Ask Git to stash my credentials

Unix machines:  
`git config --global credential.helper cache`  
`git config --global credential.helper 'cache --timeout=3600'`  

Mac:  
`git credential-osxkeychain`  
`git config --global credential.helper osxkeychain`  

### Firefox profile

Apply custom browser css

Activate custom css:
Open Firefox & load `about:config`, set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`

Grab our profile dir:
Load `about:profiles` and copy the root profile directory:
PROFILE_DIR=""
`mkdir $PROFILE_DIR/chrome`
`ln -s ~/.dot-files/firefox/userChrome-nix.css $PROFILE_DIR/chrome/userChrome.css`


### Font

```bash
cd ~/.dot-files/fonts/victor-mono/ && git pull && cd
mkdir ~/tmp ~/tmp/VM ~/.local/share/fonts/
cd ~/tmp/VM && unzip ~/.dot-files/fonts/victor-mono/public/VictorMonoAll.zip && cd
mv ~/tmp/VM/TTF ~/.local/share/fonts/VictorMono
rm -rf ~/tmp/VM
fc-cache -f -v
```

# Version

1.3.0  

## Version History
#### 1.3.0 - 2021-06
Added font config
#### 1.2.1 - 2021-01
New git config to prefer `main`
#### 1.2.0 - 2021-01
Add Firefox userChrome.css. Fully nuke fortune.
#### 1.1.2 - 2020-08
Fix README formatting, new git alias
#### 1.1.1 - 2019-11
Remove fortune stuff
#### 1.1.0 - 2019-10
Prefer `_local` to branching. If it's good enough to commit, it's probably worth having on other machines.
#### 1.0.0 - 2019-03
Began tracking version
