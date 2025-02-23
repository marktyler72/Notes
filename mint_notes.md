Mint Linux Notes
================

## Install Linux Mint ##
Install Linux Mint XFCE from USB stick following the instructions from the Linux Mint website.
Use the "Something Else" option when configuring the disks to select the appropriate partitions.

Update the install on first boot. You will probably have to reboot at this point.

## Tidy up installed software ##
Go through the installed software in Software Manager and remove any applictions that are not required.
Use the following command to remove applications:
  $ sudo apt remove <package-name>

Office
  * libreoffice-writer
  * libreoffice-calc
  * libreoffice-impress
  * libreoffice-draw
  * libreoffice-math
  * libreoffice-base-core
  * libreoffice-core
  * libreoffice-style-colibre
Accessories
  * hplip
  * catfish
  * timeshift
Graphics
  * simple-scan
  * printer-driver-gutenprint
  * sane-utils
Internet
  * thunderbird
  * transmission-gtk
  * yt-dlp
  * hexchat
  * network-manager-openvpn-gnome
  * cups
  * cups-ppdc
  * network-manager-openvpn
  * network-manager-pptp
  * pppoeconf
Programming
  * system-config-printer-udev
Sound and Video
  * rhythmbox
  * hypnotix
  * celluloid
  * speech-dispatcher
System Tools
  * gufw
  * ufw
  * compizconfig-settings-manager
  * xed
  * lvm2
  * apg
  * webapp-manager
  * dmraid
  * mobile-broadband-provider-info
  * ppp
  * reiserfsprogs
  * xfsprogs
  * mdadm
  * mintwelcome
  * xfce4-dict
  * thingy

## Install i3 software ##
Install the following packages from the Software Manager:
  * i3  (This is a metapackage (should drag in i3-wm, i3lock, i3status and suckless-tools))
  * rofi
  * i3blocks
  * lightdm-gtk-greeter
  * picom
  * xautolock
  * xss-lock

  * feh
  * scrot
  * rxvt-unicode
  * font-manager
 
  * playerctl
  * cmus

  * htop
  * git

## Install fonts from the Fonts section ##
 * fonts-dejavu
 * fonts-droid-fallback
 * fonts-firacode
 * fonts-font-awesome
 * fonts-freefont-ttf
 * fonts-hack
 * fonts-inconsolata
 * fonts-lato
 * fonts-liberation
 * fonts-liberation2
 * fonts-monoid
 * fonts-monoid-tight
 * fonts-monoid-halftight
 * fonts-mononoki
 * fonts-noto-mono
 * fonts-open-sans
 * fonts-powerline
 * fonts-quicksand
 * fonts-roboto
 * fonts-roboto-unhinted
 * fonts-symbola
 * fonts-ubuntu
 * fonts-ubuntu-console
 * fonts-urw-base35
 * ttf-bitstream-vera
 * ttf-mscorefonts-installer

## Setup the dotfiles and import ##
Log into Github and look at the readme in the dotfile project. Follow the instructions to set up a new host.

## Copy the config files ## 
Copy the config files to ~/.config/  (This may have already been done by the dotfles step)
  * i3
  * i3blocks
  * rofi
  * nano

## Configure alternatives ##

Set the following applications to be the default using the update-alternatives command.
Alternatives are linked in /etc/alternatives

To see the current configuration of x-session-manager
~~~
 $ update-alternatives --query x-session-manager
~~~

To set it to something else 
~~~
 $ sudo update-alternatives --config x-terminal-emulator
~~~

Set the following:
 * x-window-manager -> i3
 * x-terminal-emulator -> urxvt
 * lightdm-greeter -> lightdm-gtk-greeter.desktop

## Configure lightdm ##

Edit /etc/lightdm/lightdm.conf
If the file does not exist you can create it and just add the uncommented lines and section marker

In the [Seat:*] section make sure the following are set / unset:
~~~
  #greeter-session=pi-greeter          # <- turn off the default greeter
  greeter-session=lightdm-gtk-greeter  # <- enable the greeter we want and allow it to show users
  greeter-hide-users=false
  #user-session=default                # <- make the user session an i3 session
  user-session=i3
  #autologin-user=pi                   # <- turn off autologin
~~~

Edit /etc/lightdm/lightdm-gtk-greeter.conf
In the [greeter] section set the following:
~~~
  background=#81A9C6
  font-name=RobotoLt 11
  indicators=~clock;~host
  clock-format=%H:%M
~~~

## Font for terminal ##
DejaVu Sans Mono Book 11
Fira Code Retina 10
Hack Regular 11           ***
IBM Plex Mono Regular 11
Inconsolata Medium 13     **
JetBrains Mono Regular 11
League Mono Narrow Regular 12
Liberation Mono Regular 11  ***
Noto Mono Regular 11        ****  <-- This seems best
Ubuntu Mono Regular 13      **

## Mount and link the shared user data volume ##
Add the mount point for the volume.
  # mkdir /mnt/userdata
Edit fstab and add the entry for the volume.
  # nano /etc/fstab   

    # userdata contains shared user files
    /dev/disk/by-label/userdata               /mnt/userdata   ext4    defaults        0       2

Mount it.
  # mount /mnt/userdata

Remove the standard directories in the /home/tylerm and replace them with links to the userdata areas..
  $ for i in Documents Music Music_iTunes Pictures Projects ; do rmdir --ignore-fail-on-non-empty $i ; ln -s /mnt/userdata/mat_store/$i $i ; done

## System Info ##
To view information about the system use the inxi command.
For basic system info:
    $ inxi -b

For info about the audio subsystem:
    $ inxi -A

Disk info:
    $inxi -D
    
Network interfaces:
    $ inxi -n 
IP network info
    $ inxi --ip

USB info:
    $ inxi --usb

Disk partitions:
    $ inxi -ojpl

## Mint version info ##
Find the version info for Linux Mint in /etc/linuxmint/info
To see the version of Ubuntu it is based on see /etc/os-release
The Debian version is in /etc/debian_version 

## Services ##
To start a service use:

    $ systemctl start <service name>

To stop a service:

    $ systemctl stop <service name>

To restart a service:

    $ systemctl restart <service name>

To list the status of a service:

    $ systemctl status <service name>

To list the status of all the services:

    $ systemctl status

Show the relationship between the services:

    $ systemctl list-dependencies --all

## Service scripts ##
Service scripts are located in /etc/init.d
They are symlinked from /etc/rc<n>.d for each runlevel.

Mint uses *systemd* to start processes at boot. See the files in /etc/systemd/system etc for info.
Check for systemd by

    $ ps -p1

Use the following command to enable or disable services:

    $ update-rc.d <service> enable 
    $ update-rc.d <service> disable 


## Problems with some applications launched from drun ##
Some applications launched from drun may not work properly because they cannot request the correct elevated permissions to perform their functions (e.g. install software). This is because they cannot connect to the PolicyKit user agent. This is normally started by the session mananger under Gnome or XFCE. So we must organise to have the i3 window manager started by this session manager.
 
## Networking ##

To see the status of the network  links.
~~~
    $ ip a
~~~

## Upgrade all packages ##
Give the following commands. 
~~~
  $ sudo apt-get update
  $ sudo apt-get upgrade
~~~

Note that this does not seem to update VSCode on minor point releases. To do that you also need to do the following.

## Upgrade VSCode ##
Download the update to VSCode. Make sure to select the x86-64 64-bit version!
Install via:
~~~
  $ sudo apt install ~/Downloads/<filename>.deb
  for example -
  $ sudo apt install ~/Downloads/code_1.66.2-1649663260_arm64.deb
~~~
