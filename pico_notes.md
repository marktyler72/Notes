Pico Notes
==========

## Introduction
These are notes for setting up and doing software development on a Raspberry Pi Pico.

## Software SDK Setup
Obtained the setup script and ran it as descrbed in the Getting Started With Raspberry Pi Pico book.
~~~
    $ wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh
    $ chmod +x pico_setup.sh
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

Note: If you insert too many breakpoints into a program (maybe more than two) then VSCode will refuse to 
load the program onto the Pico with a GDB error. The solution is to disable some of the breakpoints.

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

## Use picotool to load a new program
Put the Pico into BOOTSEL mode. Can short the run pin to Gnd while holding down the BOOTSEL button. Remove short then release button.
Next give the command:
~~~
    $ sudo picotool load -v -x flash_nuke.elf -f
~~~
The -f flag runs the loaded application once it is flashed. The flash_nuke application is in pico-examples/build/flash/nuke and it will zero out the memory on the board.

# MicroPython

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

Also install Python rshell that enables CLI access to the Pico filesystem.
~~~
    $ sudo pip3 install rshell
~~~

To use it connect to the board and type one of the rshell commands.
~~~
    $ rshell --buffer-size=30 -a -p /dev/ttyACM0

    $ ls -l /pyboard
    $ cp main.py /pyboard
    $ repl
    >>> import main.py
~~~
Note: If the buffer-size is set to a bigger value (say 512) then strange behaviour can result. This includes problems copying files from the host to the Pico. Files with sizes that are multiples of 32 but not 128 bytes will hard lock the Pico. 

If the board seems stuck in a loop try to soft reboot:
~~~
    $ rshell --buffer-size=512 -p /dev/ttyACM0
    $ repl
    >>> Ctrl-D
    
~~~

If there is a problem copying a file, check to see if the file has a terminating <CR>.
If not - add one!

## Setup VS Code
Install the Pico-Go extension. Note that this requires a 64-bit OS environment.

See the following for detailed info. http://pico-go.net/docs/start/quick/

## Setup a new project
Do the following steps:
1. Create a project dir in VS Code.
2. Set the language to Python
3. Create a main.py file to hold the main code
4. Crtl-Shift-P and select Pico-Go -> Configure Project. This will enable proper code-auto-completion.


 
