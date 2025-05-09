# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc

## Installs

### Linux
```bash
sudo add-apt-repository ppa:regolith-linux/stable
sudo apt update
sudo apt install vim screen thefuck python3-distutils keepassxc curl rbenv i3-gaps i3status
```

```bash
rbenv init
echo 'eval "$(rbenv init -)"' >>~/.bashrc && source ~/.bashrc
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash
```

### OSX
I once again find myself having to work on a ~~broken unix system~~ Mac. Alas.

```bash
#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install rbenv powerlevel10k git

#install nvm
# NB: go get the real line from https://github.com/nvm-sh/nvm#install--update-script because they hardcode version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#install homebrew's huge-version vim
brew install vim
```

## Structure

### Shell Files
#### zsh Files

```bash
ln -s ~/.dot-files/zsh/.zshrc ~/
ln -s ~/.dot-files/zsh/.zprofile ~/
ln -s ~/.dot-files/zsh/.p10k.zsh ~/
```

### Bash Files
Deprecated, finally using zsh

**.bash_profile**

```bash
ln -s ~/.dot-files/bash/.bash_profile ~/
ln -s ~/.dot-files/bash/.bashrc ~/
ln -s ~/.dot-files/bash/.bashrc_git ~/
ln -s ~/.dot-files/bash/.bash_aliases ~/
```

Machine specific overrides placed in a `[base_file]_local` will be imported

### Vim files

```bash
ln -s ~/.dot-files/vim/.vimrc ~/
```
Plugins install on first run.

Machine specific overrides aren't well handled

### Screen file

```bash
ln -s ~/.dot-files/screen/.screenrc ~/
```

Machine specific overrides should be placed in file `~/.screenrc_local`

### Git
#### Set Git configs

Set editor, user, and email. In this house we use `main`

```bash
git config --global core.editor "vim"
git config --global user.email "email@example.com"
git config --global user.name "Kat Tipton"
git config --global init.defaultBranch main
```

Set aliases for a nice history log and to cleanup local merged branches

```bash
git config --global alias.hist "log --graph --full-history --all --no-merges --pretty=format:'%Cred%h%Creset %ad %s %C(green)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
git config --global alias.co checkout
```

#### User-level Git ignore

```bash
ln -s ~/.dot-files/git/.gitignore ~/
git config --global core.excludesfile ~/.gitignore
```

#### Ask Git to stash my credentials

Unix machines:

```bash
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
```

Mac:

```bash
git config --global credential.helper osxkeychain
```

### Kitty

Linux:
```bash
ln -s ~/.dot-files/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Mac:

### Firefox profile styling

First, install [Tree Style Tab](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/) and [TST More Tree Commands](https://addons.mozilla.org/en-US/firefox/addon/tst-more-tree-commands/), and move the sidebar to the right.

To activate custom css, open Firefox & load `about:config`, set
`toolkit.legacyUserProfileCustomizations.stylesheets` to `true`

Open `about:profiles` and copy the root profile directory

```bash
PROFILE_DIR=""
mkdir $PROFILE_DIR/chrome
ln -s ~/.dot-files/firefox/userChrome-nix.css $PROFILE_DIR/chrome/userChrome.css
```

### Font

**Linux**
```bash
git clone https://github.com/rubjo/victor-mono ~/.victor-mono
mkdir ~/tmp ~/tmp/VM ~/.local/share/fonts/
cd ~/tmp/VM && unzip ~/.victor-mono/public/VictorMonoAll.zip && cd
mv ~/tmp/VM/TTF ~/.local/share/fonts/VictorMono
rm -rf ~/tmp/VM
fc-cache -f -v
```

**Mac**
```bash
brew install --cask font-victor-mono
```

### i3wm

```bash
git clone https://github.com/lomky/i3blocks-contrib ~/.config/i3blocks
mkdir -p ~/.config/i3
ln -s ~/.dot-files/i3/i3-config ~/.config/i3/config
ln -s ~/.dot-files/i3/i3blocks-config ~/.config/i3blocks/config
```

Background images:

set the script to gnome or i3

if on i3, install feh
```bash
sudo apt install feh
```

set the cron:
```bash
* * * * * ~/.dot-files/bin/random-unsplash-background
```






# Version

1.8.2

## Version History
#### 1.8.2 - 2023-04
Add firefox details
Better vim and font installation for mac
#### 1.8.1 - 2023-03
Making the swap to zsh
Setting Mac stuff back up
Minor vimrc tweaks
#### 1.7.0 - 2022-01
basic settings for bash, screen, & git cleanup
abandon long disused variants
readme formatting cleanup
#### 1.6.0 - 2021-11
rewrite vimrc
beta background script
#### 1.5.1 - 2021-07
i3-gaps
Added todo
#### 1.5.0 - 2021-07
Add i3wm
#### 1.4.1 - 2021-06
Fix font config, typos
#### 1.4.0 - 2021-06
Added font config
#### 1.3.0 - 2021-03
Setup installs section
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

# TODO
c/p getting unwieldly, probably should look into a proper bash script
