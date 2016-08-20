echo "Start installing guake configurations."

#checking the autostart folder already exists
if [ ! -d ~/.config/autostart/ ]; then
  mkdir ~/.config/autostart/
fi

cp -f ./guake.desktop ~/.config/autostart/

#checking the apps config folder already exists
if [ ! -d ~/.gconf/apps/ ]; then
  mkdir ~/.gconf/apps/
fi

#checking the guake config folder already exists
if [ ! -d ~/.gconf/apps/guake/ ]; then
  mkdir ~/.gconf/apps/guake
fi

cp -rf ./guake/ ~/.gconf/apps/guake/
