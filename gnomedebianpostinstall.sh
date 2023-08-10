#!/usr/bin/env bash

#Create some additional directories we will use later
mkdir ~/.themes
mkdir ~/.icons
mkdir ~/software
mkdir ~/Pictures/wallpapers
cp ./wallpaper/Wallpaper-House.com_391811.jpg ~/Pictures/wallpapers

#If upgrading to Debian testing on a VM uncomment the following
#To install extensions etc.
#sudo apt -y install dkms
#sudo apt -y install linux-headers-$(uname -r) 

#If you want to used TLP un-comment for power management.
#Research the different power options between TLP and Gnome Power Management for your platform
#sudo apt -y install tlp

#For my ThinkPad T440p power management
#sudo apt -y install acpi-call-dkms

#Add contrib and non-free repositories
sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.original
#sudo sed -i 's/main/main non-free contrib/g' /etc/apt/sources.list

#Update and update packages
sudo apt -y update
sudo apt -y upgrade

# Enable minimize, maximize, and close button
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

#Install additional graphical drivers if applicable
#Nvidia
#sudo apt -y install nvidia-detect
#sudo nvidia-detect
#sudo apt -y install nvidia-driver

#AMD
#sudo apt install firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu

#Remove unnecessary apps
sudo apt -y purge aisleriot five-or-more lightsoff tali swell-foop iagno four-in-a-row quadrapassel hitori gnome-klotski gnome-taquin gnome-tetravex gnome-mines gnome-nibbles gnome-chess gnome-sudoku gnome-robots gnome-2048 gnome-contacts gnome-calendar gnome-maps
sudo apt -y autoremove

#Install additional software vim, tmux, etc.
sudo apt -y install vim tmux git tilix neofetch nmap tcpdump curl build-essential dconf-editor debian-reference-en

#Set up .vimrc. Turn off syntax highlighting, turn on numbering, set up paste capability in Vim
echo "syntax on" > ~/.vimrc
echo "set number" >> ~/.vimrc
echo "set mouse=r" >> ~/.vimrc

#Install VLC and Plugins
sudo apt -y install vlc vlc-plugin-samba vlc-plugin-video-splitter

#Install Restricted-Extras Packages
sudo apt -y install libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi
#sudo apt -y install ttf-mscorefonts-installer rar unrar

#Install ufw enable 
sudo apt -y install ufw
sudo ufw enable
sudo ufw status verbose
sudo ufw app list
sudo ufw status numbered

#Configure Swappiness
sudo cat /proc/sys/vm/swappiness
sudo /bin/su -c "echo 'vm.swappiness = 10' > /etc/sysctl.d/swappiness.conf"
sudo sysctl -f /etc/sysctl.d/swappiness.conf
sudo sysctl -a | grep vm.swappiness

#Speed up the boot time
sudo cp -p /etc/default/grub /etc/default/grub.original
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub
sudo grep GRUB_TIMEOUT /etc/default/grub

#Install easy theme if you don't want to customize too much
sudo apt -y install numix-gtk-theme numix-icon-theme-circle

#Enable Snap and Flatpak support
#Open Software Center and Search for Gnome Software to confirm installation
sudo apt -y install flatpak
sudo apt -y install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install VSCode by Flatpak
sudo flatpak -y install flathub com.visualstudio.code

#Switch to X.org as Wayland does not work as work
#Select System X11 Default at login screen
ps -e | grep X
