Pico Notes
==========

## Introduction
These are notes for setting up and doing software development on a Raspberry Pi Pico.

## Software SDK Setup
Obtained the setup script and ran it as descrbed in the Getting Started With Raspberry Pi Pico book.
~~~
    $ wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh
    $ chmode +x pico_setup.sh
    $ ./pico_setup.sh
~~~

## Access the pico via USB
Set up the mount point and edit /etc/fstab first.
~~~
    $ sudo mkdir /media/pi/pico
    Add the following line to /etc/fstab
/dev/sda1	/media/pi/pico	vfat	user,noauto,rw	0	2
~~~

Mount the pico using USB
~~~
    $ sudo mount /dev/sda1 /media/pi/pico
~~~

## Communicate using serial from Raspberry Pi
Use minicom to communicate via a serial link. Note the pico has to unmounted and not in USB mass storage mode.
~~~
    $ minicom -b 115200 -o -D /dev/ttyACM0
~~~

To use the UART as a serial port use:
~~~
    $ minicom -b 115200 -o -D /dev/serial0
~~~

## Use openocd to program the Pico
To program the Pico using the OpenOCD, verify the flash worked and then reset and run the code: 
~~~
    $ cd build/<path-to-executable>
    $ openocd -f ~/projects/pico/openocd/tcl/interface/raspberrypi-swd.cfg -f ~/projects/pico/openocd/tcl/target/rp2040.cfg -c "program <program_name.elf> verify reset exit"
~~~

## Set up VS Code to debug a Pico
Run the pico-project-generator/pico_project.py to set up a project and generate the required VSCode startup files.
~~~
    $ ./pico-project-generator/pico_project.py --gui
~~~

You will probably have to edit the .vscode/launch.json file before you can debug the new project.
~~~
    Replace:
    "runToMain": true,
    
    With:
    "runToEntryPoint": "main",
~~~

## Use picotool to query the code loaded on a Pico
First step is to put the Pico in BOOTSEL mode (hold down button while powering)
Next give the command:
~~~
    $ sudo picotool info -a
~~~

We can also use it to query a program on the local file system.
~~~
    $ picotool info -a <program_name.uf2>
~~~

## Install MicroPython on the Pico
First step is to put the Pico in BOOTSEL mode (hold down button while powering)
Next give the command:
~~~
    $ sudo mount /dev/sda1
    $ sudo cp ~/Downloads/rp2-pico-20220117-v1.18.uf2 /media/pi/pico/
~~~

You can access the REPL via the USB serial port.
~~~
    $ minicom -b 115200 -o -D /dev/ttyACM0
~~~
