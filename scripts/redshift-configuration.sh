echo "Start installing guake configurations."

#checking the autostart folder already exists
if [ ! -d ~/.config/autostart/ ]; then
  mkdir ~/.config/autostart/
fi

cp -f ./redshift.desktop ~/.config/autostart/
