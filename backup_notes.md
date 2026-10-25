Backup Files Notes
==================

## Mount the backup disk ##
Mount the disk on which to do the backup. In this case the Seagate 4TB disk is /dev/sdb2

  $ sudo mount /dev/sdb2 /media/tylerm/disk1
  $ ls /media/tylerm/disk1

## Photos from SD card ##
Insert the SD card in the slot and mount the partition.

  $ sudo mount /dev/mmcblk0p1 /media/tylerm/disk2

Go to the destination directory (on the backup disk)

  $ cd /media/tylerm/disk1/photo_backup/X-E1\ Photos\ Raw/DCIM/

Now backup the files from the SD card

  $ sudo rsync -av /media/tylerm/disk2/DCIM/* .
  $ ls 

Once it is done unmount the SD card.

  $sudo umount /media/tylerm/disk2

## Music on the Jellyfin server ##
Shutdown the Jellyfin server and grab the SSD and plug it into the NUC. Then mount the SSD.

  $ sudo mount /dev/sdc2 /media/tylerm/disk2

Go to the destination directory (on the backup disk)

  $ cd /media/tylerm/disk1/media/

Backup all the music files from the jellyfin directory.

  $ sudo rsync -av /media/tylerm/disk2/media/jellyfin .

Once it is done unmount the SSD.

  $sudo umount /media/tylerm/disk2


