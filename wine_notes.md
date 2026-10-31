Wine Notes
==========

## Setup Issues ##

If there are any issues installing Windows programs to run on the machine you may have to install extra packages. 
For NanoCAD it required winbind package to be installed first before successfully installing.

  $ sudo apt install winbind

## NanoCAD ##

To install NanoCAD download the installer application and run it.

  $ wine NCE_x64_22.0_5984.3737.6093_mega.exe

The application will end up in ~/.wine/drive_c/Program\ Files/Nanosoft/nanoCAD\ x64\ en\ 22.0/
To run it 

  $ wine .wine/drive_c/Program\ Files/Nanosoft/nanoCAD\ x64\ en\ 22.0/nCad.exe

## Sketchup ##

Install 
  $ wine sketchupmake-2017-2-2555-90782-en-x64.exe

Run
  $ wine sketchup

## Geometrize ##

The Geometrize application is available as a native Linux app. Download the AppImage, modify the permissions and then
execute the app,

  $ mv geometrize_1.0.1_linux.AppImage ./bin
  $ chmod a+x geometrize_1.0.1_linux.AppImage
  $ geometrize_1.0.1_linux.AppImage

  
