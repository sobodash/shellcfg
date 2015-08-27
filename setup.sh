#!/bin/sh
echo "Testing machine type..."
if [ "`cat /proc/cpuinfo | grep yeeloong`" != "" ]; then
	MACH=yeeloong
elif [ "`cat /proc/cpuinfo | grep 'model name' | grep 'Celeron(R) M'`" != "" ]; then
	MACH=eeepc701
else
	MACH=i686
fi
echo "Identified machine as $MACH!"

echo "Storing machine type to ~/.mach..."
echo $MACH > ~/.mach

echo "Linking shell config..."
ln -s $PWD/root/bashrc ~/.bashrc
ln -s $PWD/root/bash_profile ~/.bash_profile
ln -s $PWD/root/vimrc ~/.vimrc
ln -s $PWD/root/mc ~/.mc
ln -s $PWD/root/hgrc ~/.hgrc

echo "Linking Xorg config..."
ln -s $PWD/root/xinitrc ~/.xinitrc
ln -s $PWD/root/Xresources ~/.Xresources
ln -s $PWD/root/gtkrc-2.0 ~/.gtkrc-2.0

echo "Linking awesome config..."
mkdir ~/.config >>/dev/null 2>&1
ln -s $PWD/awesome ~/.config/awesome

if [ $MACH != "i686" ]; then
	echo "Linking mednafen config..."
	mkdir ~/.mednafen >>/dev/null 2>&1
	ln -s $PWD/mednafen/$MACH ~/.mednafen/mednafen-09x.config
fi

echo "Linking bashlets..."
mkdir ~/.local >>/dev/null 2>&1
mkdir ~/.local/bin >>/dev/null 2>&1
mkdir ~/.local/share >>/dev/null 2>&1
ln -s $PWD/bashlets ~/.local/share/bashlets
ln -s $PWD/scripts/check-power ~/.local/bin/check-power

echo "Linking files that need root permissions..."
if [ $MACH != "i686" ]; then
	sudo ln -s $PWD/xorg.conf/$MACH /etc/X11/xorg.conf
	sudo ln -s $PWD/buildflags.conf/$MACH /etc/dpkg/buildflags.conf
fi
sudo ln -s $PWD/root/gtkrc-2.0 /root/.gtkrc-2.0
