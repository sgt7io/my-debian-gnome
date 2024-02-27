![Debian Logo](images/debian.png) ![Gnome Logo](images/gnome.png)

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.

# My Debian Gnome Install

This script is to automate as much as possible the post installation of my Debian with Gnome desktop system or provide instructions for personalization. It is still a work in progress and if manual steps are automated obviously they will be moved from this README to the debianGnomeSetup.sh script. Obviously you take this repository and modify it to your taste.

1. Clone this repository to your home directory.

```bash
cd ~
git clone git@github.com:sgt7io/my-debian-gnome.git
cd my-debian-gnome
```

2. Run the debianGnomeSetup.sh script

```bash
$ chmod 700 debianGnomeSetup.sh
$ ./debianGnomeSetup.sh
```

## Install Desktop Desktop Icons,and User Themes Extensions

There are numerous themes and icons on the internet, but I simply use the
easy to install Numix GTK theme and Numix circle icons.

I also use the following wallpaper, which I sourced from [Wallpaper House](https://wallpaper-house.com/wallpaper-id-391811.php "Wallpaper House")

![Feather Wallpaper](images/wallpaperpreview.png)

## After I run the scripts I currently perform the following steps manually:

## Personalization

- Go to Settings => Users => and set your user image if you want your system a little more personal.

## Add Shortcuts

- Terminal shortcut

  - Go to Settings => Keyboard => Keyboard Shortcuts

  - Select View and Customize Shortcuts

  - Select Custom Shortcuts => Add Shortcut

  - Name it Open Terminal and type gnome-terminal as a command To set the shortcut, press whatever key combinazion that you prefer

- Xkill shortcut

  - Name it Xkill and type xkill as a command To set the shortcut, press whatever key combinazion that you prefer

- Change LibreOffice look

  - Tools => Options => View => Icon Theme. Select Colibre icons from the drop down and select Apply.

## Enable Gnome Shell Extensions

https://extensions.gnome.org/

- Install the GNOME Shell browser extension. You should see a prompt at the top of the page.

  - I add Dash to Dock in order to have a more personalized dock

## Enable Nightlight

- Settings => Display => and set Night Light on with your desired settings

## Firefox DRM Settings

- Under settings search for DRM and select enable

## Switch to X11 from Wayland

Before executing all the steps I personally switch to X.org as Wayland does not work as well in my opinion, but your experience may vary.

Prior to logging in select System X11 Default at login screen.
You can can verify from the terminal once you log in.
ps -e | grep X
