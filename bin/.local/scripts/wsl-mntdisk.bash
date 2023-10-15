#!/usr/bin/bash
#wsl ubuntu doesn't identify external disk mount
sudo umount /mnt/d
sudo mount -t drvfs D: /mnt/d
