#!/bin/bash

#script extraido de: http://paulocassiano.wordpress.com/2008/08/29/deixando-o-gedit-com-a-cara-do-textmate/
#tip for better "resolution" here: http://blog.siverti.com.br/2008/05/22/fonte-monaco-no-ubuntugedit/

#checking the autostart folder already exists
if [ ! -d /usr/share/fonts/truetype/otf-monaco-patched ]; then
	sudo mkdir /usr/share/fonts/truetype/otf-monaco-patched
fi

sudo cp fonts/monaco-patched.otf /usr/share/fonts/truetype/otf-monaco-patched/

cd 
#create an index of X font files in a directory
sudo mkfontdir /usr/share/fonts/truetype/otf-monaco-patched

fc-cache