
all: update-pkdg prompt sublime bamboo ssh-key latex chrome font-monaco oh-my-zsh agnoster

update-pkdg:
	sudo apt-get update && sudo apt-get dist-upgrade

#################################
## fonts and general settings ###
#################################

font-monaco:
	echo "installing monaco"
	sh ./fonts/monaco.sh

powerline:
	echo "installing powerline"
	pip install --user git+git://github.com/Lokaltog/powerline

font-monaco-patched:
	echo "installing patched monaco"
	sr ./fonts/potched_monaco.sh

##################################
############ python ############## 
##################################

pip:
	echo "installing python-pip"
	sudo apt install python-pip

###################################
## Sublime text and its packages ##
###################################

sublime: sublimetext sublime-packages

sublime-packages: bamboo JSHint

# For latest Ubuntus as 14.04 the next script would work instead
# wget http://download.sublimetext.com/sublime-text_build-3103_amd64.deb
# sudo dpkg -i sublime-text_build-3103_amd64.deb
# sudo apt-get install -f
# rm  sublime-text_build-3103_amd64.deb
sublimetext: 
	echo "Installing Sublime text 3"
	sudo apt install sublime-text	

# install baboo theme with monaco font
bamboo: font-monaco
	echo "Installing Bamboo theme"
	git clone https://github.com/gzhihao/bamboo-theme.git ~/.config/sublime-text-3/Packages/Theme\ -\ Bamboo
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

guake:
	echo "Installing guake"
	sudo apt-get install guake -y 

guake-configuration:
	sh scripts/guake-configuration.sh

update-guake-config:
	git rm -rf guake/
	cp -r ~/.gconf/apps/guake/ ./
	git add guake/
	git commit -m"updated guake config to current config"
	git push 

###################################
##### Shell script languages ######
###################################

oh-my-zsh: zsh
	echo "Installing oh-my-zsh"
	curl -L http://install.ohmyz.sh > install-oh-my-zsh.sh
	sh install-oh-my-zsh.sh
	rm install-oh-my-zsh.sh

zsh:
	echo "Installing zsh"
	sudo apt-get install -y zsh

agnoster: powerline patched-fonts
	echo "setting agnoster zsh theme and powerline patched fonts"
	cp ./zshrc ~/.zshrc

###################################
##### Version control systems #####
###################################

subversion:
	echo "Installing subversion (svn)"
	sudo apt-get install subversion

git:
	echo "Installing git"
	sudo apt-get install git

git-aliases:
	echo "setting Git aliases"
	git config --global alias.co checkout
	git config --global alias.br branch
	git config --global alias.ci commit
	git config --global alias.st status
	git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git-configurations:
	git config --global user.email "laouen.belloli@gmail.com"
	git config --global user.name "Laouen"


###################################
######## NodeJS and mocha ######### # TODO(not ready yet)
###################################

# For latest Ubuntus as 14.04 the next script would work instead
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# sudo apt-get install nodejs
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
