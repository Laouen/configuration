all: update-pkdg prompt sublime guake ssh-key latex nodejs mocha chrome dropbox entry-languages

update-pkdg:
	sudo apt-get update && sudo apt-get dist-upgrade

###################################
## Sublime text and its packages ## # TODO(jsdoc comment plugin still left)
###################################

sublime: sublimetext sublime-packages

sublime-packages: bamboo JSHint

sublimetext: 
	echo "Installing Sublime text 3"
	wget http://download.sublimetext.com/sublime-text_build-3103_amd64.deb
	sudo dpkg -i sublime-text_build-3103_amd64.deb
	sudo apt-get install -f
	rm  -text_build-3103_amd64.deb

bamboo: 
	echo "Installing Bamboo theme"
	git clone https://github.com/gzhihao/bamboo-theme.git ~/home/lao/.config/sublime-text-3/Packages/Theme\ -\ Bamboo
	cp -f ./Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
	
JSHint:
	echo "Installing JSHint plugin"
	git clone https://github.com/victorporof/Sublime-JSHint.git ~/.config/sublime-text-3/Packages/Sublime-JSHint


###################################
#### Latex editor and packages ####
###################################


latex: texmaker texlive-full ibus-qt4 spanish-speller-texmaker

texmaker:
	echo "Installing texmaker"
	wget http://www.xm1math.net/texmaker/texmaker_ubuntu_14.04_4.5_amd64.deb
	sudo dpkg -i texmaker_ubuntu_14.04_4.5_amd64.deb
	sudo apt-get install -f
	rm texmaker_ubuntu_14.04_4.5_amd64.deb

spanish-speller-texmaker:
	echo "Installing spanish speller for texmaker"
	cp Documents/configuration/spanish-speller-texmaker/es_ES.dic /usr/share/myspell/dicts/
	cp Documents/configuration/spanish-speller-texmaker/es_ES.aff /usr/share/myspell/dicts/

ibus-qt4:
	echo "Installing ibus-qt4"
	sudo apt-get install ibus-qt4

texlive-full:
	echo "Installing textlive-full"
	sudo apt-get install texlive-full

###################################
#### Guake and prompt configs #####
###################################

prompt:
	echo "Setting prompt"
	cp -f ./bashrc ~/.bashrc

guake: oh-my-zsh
	echo "Installing guake"
	sudo apt-get install guake -y 
	cp -f ./guake.desktop ~/.config/autostart/
	cp -rf ./guake/ ~/.gconf/apps/guake/

update-guake-config:
	git rm -rf guake/
	cp -r ~/.gconf/apps/guake/ ./
	git add guake/
	git commit -m"updated guake config to current config"
	git push 

###################################
##### Shell script languages ###### # TODO(not ready yet)
###################################

oh-my-zsh: zsh curl
	echo "Installing oh-my-zsh"
	curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

zsh:
	echo "Installing zsh"
	sudo apt-get install -y zsh

curl:
	echo "Installing curl"
	sudo apt-get install -y curl

###################################
##### Version control systems #####
###################################

subversion:
	echo "Installing subversion (svn)"
	sudo apt-get install subversion

git:
	echo "Installing git"
	sudo apt-get install git

###################################
######## NodeJS and mocha ######### # TODO(not ready yet)
###################################

nodejs:
	echo "Installing Node.js"
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install nodejs

mocha:
	echo "Installing mocha"
	npm install -g mocha

###################################
####### Ardour and plugins ########  # TODO(not ready yet)
###################################

ardour:
	sudo add-apt-repository ppa:dobey/audiotools
	sudo apt-get update
	sudo apt-get install ardour

###################################
######### Chrome browser ##########
###################################

chrome:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo apt-get install -f
	rm google-chrome-stable_current_amd64