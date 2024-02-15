#!/usr/bin/env bash

declare script_dir="$(realpath $(dirname -- "$0"))"
source $script_dir/functions.sh

# Menu for selecting the installation steps
while true; do
    echo 'Please select an option:'
    echo '1. Update and patch your Debian host (Will be prompted for admin password)'
    echo '2. Create custom directories in your home directory'
    echo '3. Copy wallpapers to your ~/Pictures/wallpapers directory'
    echo '4. Install packages specified in package_install.txt'
    echo '5. Remove packages specified in package_remove.txt'
    echo '6. Customize Gnome settings'
    echo '7. Customize vimrc file settings'
    echo '8. '
    echo '9. Execute All'
    echo '0. Exit'
    echo -n 'Enter the number of your choice: '
    read choice

    case $choice in
        1)  
            update_debian
            ;; 
            
        2)  
            create_directories
            ;; 

        3)  
            copy_wallpapers
            ;; 
    
        4)  
            install_packages
            ;;

        5)  
            remove_packages
            ;;
        
        6)  
            customize_gnome
            ;;
        
        7) 
            configure_vimrc
            ;;
            
        8)   
            update_debian
            create_directories
            copy_wallpapers
            install_packages
            remove_packages
            customize_gnome
            configure_vimrc
            ;;    

        0)
            echo 'Exiting.'
            break
            ;;
        *)
            echo 'Invalid option. Please try again.'
            ;;
    esac
done