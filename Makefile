all: prompt sublime guake ssh-key latex nodejs mocha chrome dropbox entry-languages

sublime: sublimetext sublime-packages

sublime-packages: bamboo JSHint

latex: texmaker texlive-full ibus-qt4

texmaker:
	echo "Installing texmaker"
	wget http://www.xm1math.net/texmaker/texmaker_ubuntu_14.04_4.5_amd64.deb
	sudo dpkg -i texmaker_ubuntu_14.04_4.5_amd64.deb
	sudo apt-get install -f
	rm texmaker_ubuntu_14.04_4.5_amd64.deb

ibus-qt4:
	echo "Installing ibus-qt4"
	sudo apt-get install ibus-qt4

texlive-full:
	echo "Installing textlive-full"
	sudo apt-get install texlive-full

prompt:
	echo "Setting prompt"
	cp -f ./bashrc ~/.bashrc

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

nodejs:
	echo "Installing Node.js"
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install nodejs

mocha:
	echo "Installing mocha"
	npm install -g mocha

guake:
	echo "Installing guake"
	sudo apt-get install guake -y 
	cp -f ./guake.desktop ~/.config/autostart/
	cp -rf ./guake/ ~/.gconf/apps/guake/

ssh-key:
	echo "Generating ssh-key"
	set timeout 5
	apg -n 1 -a 1 > ssh-pass
	pass=$( cat ssh-pass )
	spawn ssh-keygen
	expect 'Enter file in which to save the key (/home/lao/.ssh/id_rsa):'
	send '\r'
	expect {
		timeout	{send_user '\n ssh key didn\'t exist'}
		'Overwrite (y/n)?'
	}
	send 'y\r'
	expect 'Enter passphrase (empty for no passphrase):'
	send ${pass}'\r'
	expect 'Enter same passphrase again:'
	send ${pass}'\r'

chrome:

dropbox:

entry-languages:

