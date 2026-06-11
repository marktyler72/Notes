Music Notes
===========

## Jellyfin storage ##
The music files for Jellyfin are stored in 
  /media/jellyfin/music
The permissions on the individual files are -rwxrwxrwx 1 jellyfin jellyfin

This is on the Jellyfin server: rpi4.local

## Convert a file from .m4a to .mp3 ##
Sometimes we want to convert a file from .m4a format to .mp3. This can be useful if the tags in the original file are screwed up.

  $ ffmpeg -i input_file.m4a -c:v copy -c:a libmp3lame -q:a 2 output_file.mp3
  
## Edit the tags in music files ##
First get the external disk from the Jellyfin server and plug it into the desktop then mount the disk.
  $ sudo mount /dev/sdb2 /media/tylerm/disk1

To edit the tags in files use the EasyTag app.

  $ sudo easytag /path/to/music/files   (need to use sudo because the files are owned by the jellyfin user)
  e.g. $ sudo easytag  /media/tylerm/disk1/media/jellyfin/music/Oasis

EasyTag will scan all the files in the directory and try to determine the correct changes to make. 
Often you have to edit the fields directly. When you edit a field (say title) then click on the "A|" at the far right of the field. 
If you have multiple files that need the same value for a field (e.g. same Artist) then *select all the files that require the change* then apply to all.

Once you have made all the changes don't forget to go and set the ownership and permissions back to what they should be otherwise root will own them. 
