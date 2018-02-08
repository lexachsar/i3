#!/bin/bash

apt install i3-wm
apt install i3lock
apt install i3blocks

##############################
# A directory for temp files #
##############################
mkdir tmp


###########################
# installing dependencies #
###########################

#clonning repo with San Francisco fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git tmp/YosemiteSanFranciscoFont

#making directory for fonts
mkdir ~/.fonts
#copying all fonts to fonts directory
cp -r -v tmp/YosemiteSanFranciscoFont/*.ttf ~/.fonts


#install rofi
apt install rofi

#install xrandr
apt install arandr

#install scrot
apt install scrot

#APPEARENCE
#install the arc-theme
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
apt-get update
apt-get install arc-theme
rm -f -v /etc/apt/sources.list.d/arc-theme.list

#install moka icon pack
add-apt-repository ppa:moka/daily
apt-get update
apt-get install moka-icon-theme faba-icon-theme faba-mono-icons

###########################
# Config files generation #
###########################

cp config/config tmp

#screen resolution specifying
{
	a=1023
	b=767
	while [ "$a" -lt "1024" ] && [ "$b" -lt "768" ]; do
		echo "What is your screen resolution(a x b)?\n"
	        echo -n "a = "
	        read a
	        echo -n "b = "
	        read b
	done    
}

echo "#screen settings" >> tmp/config
echo "exec_always xrandr --output VGA-1 --primary --mode "$a"x"$b" --pos 0x0 --rotate normal --output DVI-I-1 --off --output HDMI-1 --off" >> tmp/config

#theme add
echo | cat theme.conf >> tmp/config 

#copying config files to their destenation places
#################################################
#################################################

#copyinf i3 windows manager config file
mkdir ~/.config/i3
cp -f -v tmp/config ~/.config/i3

#copying i3 blocks config file
cp -f -v config/i3blocks.conf ~/.config/i3

#copying gtk-3.0 config file
mkdir ~/.config/gtk-3.0
cp -f -v config/settings.ini ~/.config/gtk-3.0

#copying gtk-2.0 config file
cp -f -v config/.gtkrc-2.0 ~/

#copying scripts to their destinattion

cp -f -v scripts/lock.sh ~/.config/i3


#copying pictures


mkdir ~/Pictures/Icons

cp -f -v pictures/lock.png ~/Pictures/Icons

####################
# tmp dir removing #
####################

rm -r -f -v tmp 
