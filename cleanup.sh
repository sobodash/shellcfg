#!/bin/sh
echo "Purging machine type..."
rm ~/.mach >>/dev/null 2>&1

echo "Purging shell config..."
rm ~/.bashrc >>/dev/null 2>&1
rm ~/.bash_profile >>/dev/null 2>&1
rm ~/.vimrc >>/dev/null 2>&1
rm ~/.mc >>/dev/null 2>&1
rm ~/.hgrc >>/dev/null 2>&1

echo "Purging Xorg config..."
rm ~/.xinitrc >>/dev/null 2>&1
rm ~/.Xresources >>/dev/null 2>&1
rm ~/.gtkrc-2.0 >>/dev/null 2>&1

echo "Purging awesome config..."
rm ~/.config/awesome >>/dev/null 2>&1

echo "Purging mednafen config..."
rm ~/.mednafen/mednafen-09x.config >>/dev/null 2>&1

echo "Purging bashlets..."
rm ~/.local/share/bashlets >>/dev/null 2>&1
rm ~/.local/bin/check-power >>/dev/null 2>&1

echo "Purging files that need root permissions..."
sudo rm /etc/X11/xorg.conf >>/dev/null 2>&1
sudo rm /etc/dpkg/buildflags.conf >>/dev/null 2>&1
sudo rm /root/.gtkrc-2.0 >>/dev/null 2>&1

