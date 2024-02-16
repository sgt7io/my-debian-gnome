#!/usr/bin/env bash

update_debian() {
    sudo apt -y update
    sudo apt -y upgrade
}

create_directories() {
    local dirs=(~/.themes ~/.icons ~/software ~/scripts ~/Pictures/wallpapers)
    for dir in "${dirs[@]}"; do
        [ -d "$dir" ] || mkdir -p "$dir"
    done
}

copy_wallpapers() {
    cp ./wallpaper/Wallpaper-House.com_391811.jpg ~/Pictures/wallpapers
}

install_packages() {
    while IFS= read -r package; do
        sudo apt -y install "$package"
    done < package_install.txt
    echo 'Pacakges installed successfully.'
}

remove_packages() {
    while IFS= read -r package; do
        sudo apt -y purge "$package"
    done < package_remove.txt
    sudo apt -y autoremove
    echo 'Pacakges removed successfully.'
}

customize_gnome() {
    local wallpaper_path="$HOME/Pictures/wallpapers/Wallpaper-House.com_391811.jpg"
    gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_path"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$wallpaper_path"
    gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
}

configure_vimrc() {
    echo "syntax on" > ~/.vimrc
    echo "set number" >> ~/.vimrc
    echo "set mouse=r" >> ~/.vimrc
}




#add_repositories() {
#    sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.original
#    #sudo sed -i 's/main/main non-free contrib/g' /etc/apt/sources.list
#}
