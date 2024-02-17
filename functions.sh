#!/usr/bin/env bash

#1
update_debian() {
    sudo apt -y update
    sudo apt -y upgrade
    echo 'System updated successfully.'
}

install_packages() {
    while IFS= read -r package; do
        sudo apt -y install "$package"
    done < package_install.txt
    echo 'Packages installed successfully.'
}

remove_packages() {
    while IFS= read -r package; do
        sudo apt -y purge "$package"
    done < package_remove.txt
    sudo apt -y autoremove
    echo 'Packages removed successfully.'
}

#2
create_directories() {
    local dirs=(~/.themes ~/.icons ~/software ~/scripts ~/Pictures/wallpapers)
    for dir in "${dirs[@]}"; do
        [ -d "$dir" ] || mkdir -p "$dir"
    done
}

#3
copy_wallpapers() {
    cp ./wallpaper/Wallpaper-House.com_391811.jpg ~/Pictures/wallpapers
}

#4
customize_gnome() {
    local wallpaper_path="$HOME/Pictures/wallpapers/Wallpaper-House.com_391811.jpg"
    gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_path"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$wallpaper_path"
    gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
}

#5
configure_vimrc() {
    echo "syntax on" > ~/.vimrc
    echo "set number" >> ~/.vimrc
    echo "set mouse=r" >> ~/.vimrc
}

#6
install_vlc_restricted_extras() {
    sudo apt -y install vlc vlc-plugin-samba vlc-plugin-video-splitter
    sudo apt -y install libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi
}

#7
install_ufw_enable() {
    sudo apt -y install ufw
    sudo ufw enable
    sudo ufw status verbose
    sudo ufw app list
    sudo ufw status numbered
}

#8
configure_swappiness() {
    sudo cat /proc/sys/vm/swappiness
    sudo /bin/su -c "echo 'vm.swappiness = 10' > /etc/sysctl.d/swappiness.conf"
    sudo sysctl -f /etc/sysctl.d/swappiness.conf
    sudo sysctl -a | grep vm.swappiness
}

#9
speed_boot_time() {
    sudo cp -p /etc/default/grub /etc/default/grub.original
    sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
    sudo update-grub
    sudo grep GRUB_TIMEOUT /etc/default/grub
}

prep_for_vscode_install() {
    sudo apt-get install wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
}

install_vscode() {
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code
}

#add_repositories() {
#    sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.original
#    #sudo sed -i 's/main/main non-free contrib/g' /etc/apt/sources.list
#}
