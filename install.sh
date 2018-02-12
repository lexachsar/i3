#!/bin/bash

apt -qq --assume-yes install i3-wm
apt -qq --assume-yes install i3lock
apt -qq --assume-yes install i3blocks

apt -qq --assume-yes install volumeicon-alsa
mkdir ~/.config/volumeicon
cp config/volumeicon ~/.config/volumeicon


##############################
# A directory for temp files #
##############################
mkdir tmp


###########################
# installing dependencies #
###########################

#rxvt/installRXVT.sh
apt -qq --assume-yes install rxvt-unicode

cp -f -v rxvt/.Xresources ~/

git clone https://github.com/lexachsar/Dotfiles tmp/Dotfiles

cp -f -v tmp/Dotfiles/tmux/.tmux.conf ~/


#clonning repo with San Francisco fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git tmp/YosemiteSanFranciscoFont

#making directory for fonts
mkdir ~/.fonts
#copying all fonts to fonts directory
cp -r -v tmp/YosemiteSanFranciscoFont/*.ttf ~/.fonts


#install rofi
apt -qq --assume-yes install rofi

#install xrandr
apt -qq --assume-yes install arandr

#install scrot
apt -qq --assume-yes install scrot

#APPEARENCE
#install the arc-theme
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
apt-get -qq update
apt-get -qq --assume-yes install arc-theme
rm -f -v /etc/apt/sources.list.d/arc-theme.list

#install moka icon pack
add-apt-repository --yes ppa:moka/daily
apt-get -qq update
apt-get -qq --assume-yes install moka-icon-theme faba-icon-theme faba-mono-icons

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
	        echo "Samsung SyncMaster 920nw screen resolution is: 1440x900"
		echo "MacBook air 1.1 screen resolution is 1280x800"
		echo -n "a = "
	        read a
	        echo -n "b = "
	        read b
	done    
}

echo "#screen settings" >> tmp/config
echo "exec_always xrandr --output VGA-1 --primary --mode "$a"x"$b" --pos 0x0 --rotate normal --output DVI-I-1 --off --output HDMI-1 --off" >> tmp/config

# Theme add
echo | cat themes/gray-theme.conf >> tmp/config 

# Start rofi
echo "bindsym \$mod+d exec rofi -show run -lines 5 -eh 2 -width 100 -padding 250 -opacity \"85\" -bw 0 -bc \"\$rofi-bg-color\" -bg \"\$rofi-bg-color\" -fg \"\$rofi-text-color\" -hlbg \"\$rofi-bg-color\" -hlfg \"#9575cd\" -font \"System San Francisco Display 18\"" >> tmp/config

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
