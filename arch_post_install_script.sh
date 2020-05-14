#!/bin/bash
#set -e
###############################################################################
# Author	:	Erik Dubois
# Modified by	:	Michael Clement
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
###############################################################################


###############################################################################
#
#   DECLARATION OF FUNCTIONS
#
###############################################################################


func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

###############################################################################
echo "##############################################"
echo "Gathering information for package installation"
echo "##############################################"
###############################################################################
###############################################################################
echo "Is this a VirtualBox installation?  (y/n)"
read -p '(y/n): ' vbinstall
echo "#########################################"

###############################################################################
echo "Installation of additional software"
###############################################################################

if [ "$vbinstall" = "y" ]; then
	echo "###############################################"
	echo "Using software list for VirtualBox Installation"
	list=(
	geany
	geany-plugins
	libreoffice-still
	rofi
	galculator
	screenkey-git
	pcmanfm
	ranger
	alacritty
	xarchiver
	powerline
	powerline-fonts
	vifm
	)
else
	echo "######################################"
	echo "Using software for Normal Installation"
	list=(
	arcolinux-teamviewer
	geany
	geany-plugins
	libreoffice-still
	audacity
	deadbeef
	rofi
	galculator
	screenkey-git
	pcmanfm
	ranger
	alacritty
	imagewriter
	xarchiver
	powerline
	powerline-fonts
	vifm
	)
fi

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

###############################################################################

tput setaf 6;echo "################################################################"
echo "Copying bashrc and vimrc to home directory"
cp -f ~/linux-scripts/bashrc ~/.bashrc
cp -f ~/linux-scripts/vimrc ~/.vimrc

echo "Creating Vim Vundle directory, cloning Vundle, and installing plugins"
echo "################################################################"
echo;tput sgr0
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

