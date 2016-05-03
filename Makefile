all: prompt nodejs sublimetext guake ssh-key

prompt:
	echo "Setting prompt"
	cp bashrc ~/.bashrc

sublimetext: 
	echo "Installing Sublime text 3"
	wget http://download.sublimetext.com/sublime-text_build-3103_amd64.deb
	sudo dpkg -i sublime-text_build-3103_amd64.deb
	sudo apt-get install -f
	echo "Installing Bamboo theme"
	git clone https://github.com/gzhihao/bamboo-theme.git ~/home/lao/.config/sublime-text-3/Packages/Theme\ -\ Bamboo
	cat sublime-user-settings > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
	echo "Installing JSHint plugin"
	git clone https://github.com/victorporof/Sublime-JSHint.git ~/.config/sublime-text-3/Packages/Sublime-JSHint

nodejs:
	echo "Installing Node.js"
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install nodejs

guake:
	echo "Installing guake"

ssh-key:
