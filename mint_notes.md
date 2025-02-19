Mint Linux Notes
================

## Install Linux Mint ##
Install Linux Mint XFCE from USB stick following the instructions from the Linux Mint website.
Use the "Something Else" option when configuring the disks to select the appropriate partitions.

Update the install on first boot. You will probably have to reboot at this point.

## Tidy up installed software ##
Go through the installed software in Software Manager and remove any applictions that are not required.
Office
  * Libreoffice-writer
  * Libreoffice-calc
  * Libreoffice-impress
  * Libreoffice-draw
  * Libreoffice-math
  * Libreoffice-base-core
  * Libreoffice-core
  * Libreoffice-style-colibre
Accessories
  * Hplip
  * Catfish
  * Timeshift
Graphics
  * Simple-scan
  * Printer-driver-gutenprint
  * Sane-utils
Internet
  * Thunderbird
  * Transmission-gtk
  * Youtube-dl
  * Hexchat
  * Network-manager-openvpn-gnome
  * Cups
  * Cups-ppdc
  * Network-manager-openvpn
  * Network-manager-pptp
  * Pppoeconf
Programming
  * System-config-printer-udev
Sound and Video
  * Rythmbox
  * Hypnotix
  * Celluloid
System Tools
  * Gufw
  * Compizconfig-settings-manager
  * xed
  * lvm2
  * apg
  * webapp-manager
  * dmraid
  * mobile-broadband-provider-info
  * ppp
  * reiserfsprogs
  * xfsprogs

  * xfce4-dict
  * thingy

## Install i3 software ##
Install the following packages from the Software Manager:  
  * i3  Metapackage (should drag in i3-wm, i3lock, i3status and suckless-tools)
  * rofi
  * i3blocks
  * htop
  * feh
  * scrot
  * playerctl
  * cmus
  * xautolock
  * xss-lock
  
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
 * fonts-piboto
 * fonts-powerline
 * fonts-quicksand
 * fonts-roboto
 * fonts-roboto-unhinted
 * fonts-symbola
 * fonts-ubuntu
 * fonts-ubuntu-console
 * fonts-urw-base35
 * ttf-bitstream
 * ttf-mscorefonts

## Setup the dotfiles and import ##
See the Github instructions.

## Copy the config files ##
Copy the config files to ~/.config/
  * i3
  * i3blocks
  * rofi
  * nano

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
