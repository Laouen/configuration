
.PHONY: spanish-speller-texmaker guake pip powerline font-monaco-patched font-monaco agnoster sublime oh-my-zsh
all: update-pkdg prompt sublime bamboo ssh-key latex chrome oh-my-zsh agnoster

update-pkdg:
	sudo apt update && sudo apt dist-upgrade

#################################
## fonts and general settings ###
#################################

# God font monaco to install and use with oh my zsh
font-monaco:
	echo "installing monaco"
	sh ./fonts/monaco.sh

powerline:
	echo "installing powerline"
	pip install --user git+git://github.com/Lokaltog/powerline

# This font has some issues when working with oh my zsh
font-monaco-patched:
	echo "installing patched monaco"
	sh ./fonts/patched_monaco.sh

##################################
############ python ############## 
##################################

# current stable version is 4.2.0
# in the checksum sha256sum the result should be something like:
# 73b51715a12b6382dd4df3dd1905b531bd6792d4aa7273b2377a0436d45f0e78  Anaconda3-4.2.0-Linux-x86_64.sh
anaconda:
	echo "installing anaconda"
	cd /tmp
	curl -O https://repo.continuum.io/archive/Anaconda3-${version}-Linux-x86_64.sh
	sha256sum Anaconda3-${version}-Linux-x86_64.sh
	sudo bash ./Anaconda3-${version}-Linux-x86_64.sh
	source ~/.bashrc
	source ~/.zshrc
	echo '' >> ~/.zshrc
	echo '# added by Anaconda3 4.2.0 installer' >> ~/.zshrc
	echo 'export PATH="/opt/anaconda3/bin:$PATH"' >> ~/.zshrc
	soruce ~/.zshrc
	cd -

pip:
	echo "installing python-pip"
	sudo apt install python-pip

###################################
## Sublime text and its packages ##
###################################

sublimetext: 
	echo "Installing Sublime text 3"
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt update
	sudo apt install sublime-text-installer

# base 16 highlighter
base16-sublime:
	git clone git://github.com/chriskempson/base16-textmate.git ~/.config/sublime-text-3/Packages/Base16

# install baboo theme with monaco font
bamboo: font-monaco
	echo "Installing Bamboo theme"
	git clone https://github.com/gzhihao/bamboo-theme.git ~/.config/sublime-text-3/Packages/Theme\ -\ Bamboo

sublime-preferences:
	cp -f ./Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
	
JSHint: nodejs
	echo "Installing JSHint plugin"
	git clone https://github.com/victorporof/Sublime-JSHint.git ~/.config/sublime-text-3/Packages/Sublime-JSHint

###################################
#### Latex editor and packages ####
###################################

latex: texmaker texlive-full ibus-qt4 spanish-speller-texmaker

texmaker:
	echo "Installing texmaker"
	sudo apt install texmaker

spanish-speller-texmaker:
	echo "Installing spanish speller for texmaker"
	sudo cp spanish-speller-texmaker/es_ES.dic /usr/share/myspell/dicts/
	sudo cp spanish-speller-texmaker/es_ES.aff /usr/share/myspell/dicts/

ibus-qt4:
	echo "Installing ibus-qt4"
	sudo apt install ibus-qt4

texlive-full:
	echo "Installing textlive-full"
	sudo apt install texlive-full

###################################
#### Guake and prompt configs #####
###################################

prompt:
	echo "Setting prompt"
	cp -f ./bashrc ~/.bashrc

guake:
	echo "Installing guake"
	sudo apt install guake -y 

guake-configuration: agnoster
	sh scripts/guake-configuration.sh

update-guake-config:
	git rm -rf guake/
	cp -r ~/.gconf/apps/guake/ ./
	git add guake/
	git commit -m"updated guake config to current config"
	git push 

########################################
##### Shell languages and plugins ######
########################################

curl: 
	sudo apt install curl

oh-my-zsh: zsh curl
	echo "Installing oh-my-zsh"
	curl -L http://install.ohmyz.sh > install-oh-my-zsh.sh
	sh install-oh-my-zsh.sh
	rm install-oh-my-zsh.sh

zsh:
	echo "Installing zsh"
	sudo apt install -y zsh

agnoster: pip powerline font-monaco
	echo "setting agnoster zsh theme and powerline patched fonts"
	cp ./zshrc ~/.zshrc

###################################
##### Version control systems #####
###################################

subversion:
	echo "Installing subversion (svn)"
	sudo apt install subversion

git:
	echo "Installing git"
	sudo apt install git

git-aliases:
	echo "setting Git aliases"
	git config --global alias.co checkout
	git config --global alias.br branch
	git config --global alias.ci commit
	git config --global alias.st status
	git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git-configurations:
	git config --global push.default simple
	git config --global user.email "laouen.belloli@gmail.com"
	git config --global user.name "Laouen"

##################################
############ SSH #################
##################################

ssh-client:
	echo "installing ssh client to acces remote servers"
	sudo apt install openssh-client

ssh-deamon:
	echo "installing ssh on deamong to acces the computer"
	sudo apt-get install openssh-server
	sudo ufw allow 22

##################################
###### Shell customizations ######
##################################

fzf:
	echo "installing fzf march version"
	git clone --depth 1 https://github.com/m2march/fzf.git ~/.fzf
	~/.fzf/install


###################################
######## NodeJS and mocha ######### # TODO(not ready yet)
###################################

nodejs:
	echo "Installing Node.js"
	sudo apt install nodejs

mocha:
	echo "Installing mocha"
	sudo npm install -g mocha

unit:
	echo "Installing Unit.js module"
	sudo npm install -g unit.js
sinon:
	echo "Installing sinon"
	sudo npm install -g sinon

###################################
######### Chrome browser ##########
###################################

chrome:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo apt install -f
	rm google-chrome-stable_current_amd64

keepass:
	sudo add-apt-repository ppa:eugenesan/ppa
	sudo apt update
	sudo apt install keepassx

###################################
########## Shell tools ############
###################################

byobu:
	sudo apt install byobu

###################################
############ redshift #############
###################################

redshift:
	sudo apt install redshift redshift-gtk
