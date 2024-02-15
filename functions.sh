#!/usr/bin/env bash

update_debian() {
    sudo apt -y update
    sudo apt -y upgrade
}

create_directories() {
    local dirs=(~/.themes ~/.icons ~/software ~/Pictures/wallpapers)
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
    done < "$script_dir/package_install.txt"
}

remove_packages() {
    while IFS= read -r package; do
        sudo apt -y purge "$package"
    done < "$script_dir/package_remove.txt"
    sudo apt -y autoremove
}

customize_gnome() {
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