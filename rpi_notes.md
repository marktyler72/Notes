Raspberry Pi Notes
==================

## Configure the Raspberry Pi ##

Use the raspi-config tool to do initial configuration of the box.
~~~
  $ sudo raspi-config
~~~

## Install software ##

Use Add/Remove Software to install packages

Install the following from Other desktops section:
 * i3 window manager metapackage
 * i3-blocks
 * lightdm
 * lightdm-gtk-greeter
 * light-locker
 * picom ???
 * rofi
 * rxvt-unicode
 * xautolock
 * xss-lock
 
Install fonts from the Fonts section
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

Install from Accessories
 * i3status

Install from Graphics
 * feh
 * font-manager
 * scrot

Install from Multimedia
 * cmus
 * cmus-plugin-ffmpeg

Install from Programming
 * code

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
  font-name=PibotoLt 11
  indicators=~clock;~host
  clock-format=%H:%M
~~~

## Setup i3 ##
Edit ~/.dmrc to be 
~~~
  [Desktop]
  #Session=lightdm-xsession
  Session=i3
~~~

Edit .xinitrc to be 
~~~
  exec i3
~~~

Now setup the following configuration files:
~~~
  ~/.config/i3/config 
  ~/.config/i3blocks/config 
  ~/.config/rofi/config.rasi 
~~~

And edit all of the required resources in ~/.Xresources

## Setup the swap area ##

Only 100M of swap space is configured by default. Increase this as follows.
~~~
  $ sudo dphys-swapfile swapoff    # Turn off swap.
  $ sudo nano /etc/dphys-swapfile  # Edit the configuration file and change the parameters as follows.

  CONF_SWAPSIZE= 
  CONF_SWAPFACTOR=2
  CONF_MAXSWAP=

  $ sudo dphys-swapfile setup     # Turn off swap.
  $ sudo dphys-swapfile swapon     # Turn swap back on.
~~~

You should end up with a swap file of around 7G on a 4G machine.

## Properties of a window ##

To determine the X-windows properties of a window (including class name) use:
~~~
  $ xprop
~~~

And click on the appropriate window.

## OS version info ##

To see the version of Raspbian see /etc/os-release
The Debian version is in /etc/debian_version 

## Services ##

To start a service use:
~~~
    $ systemctl start <service name>
~~~

To stop a service:
~~~
    $ systemctl stop <service name>
~~~

To restart a service:
~~~
    $ systemctl restart <service name>
~~~

To list the status of a service:
~~~
    $ systemctl status <service name>
~~~

To list the status of all the services:
~~~
    $ systemctl status
~~~

Show the relationship between the services:
~~~
    $ systemctl list-dependencies --all
~~~

## Service scripts ##

Service scripts are located in /etc/init.d  
They are symlinked from /etc/rc<n>.d for each runlevel.

Raspbian uses *systemd* to start processes at boot. See the files in /etc/systemd/system etc for info.
Check for systemd by
~~~
    $ ps -p1
~~~

Use the following command to enable or disable services:
~~~
    $ update-rc.d <service> enable 
    $ update-rc.d <service> disable 
~~~

## Networking ##

To see the status of the network  links.
~~~
    $ ip a
~~~

## Fonts for X ##
Use fc-list to see the fonts that are available on the system.
~~~
  $ fc-list : | sort   ## list all fonts and styles known to fontconfig

  $ fc-list :lang=en family | sort    ## list all fonts with english encodings
  $ fc-list -f "%{family} : %{file}\n" :spacing=100 | sort    ## list monospace fonts by family and file
  $ fc-list :style=Bold | sort      ## all bold fonts
  $ fc-list :spacing=100 lang=en family | sort      ## all monospace english fonts
~~~

## Upgrade all packages ##
Give the following commands. 
~~~
  $ sudo apt-get update
  $ sudo apt-get upgrade
  $ sudo rpi-update   <--- you may not want to do this last step.
~~~

Note that this does not seem to update VSCode on minor point releases. To do that you also need to do the following.

## Upgrade VSCode ##
Download the update to VSCode. Make sure to select the ARM 64-bit version!
Install via:
~~~
  $ sudo apt install ~/Downloads/<filename>.deb
  for example -
  $ sudo apt install ~/Downloads/code_1.66.2-1649663260_arm64.deb
~~~
