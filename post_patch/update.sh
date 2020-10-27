#!/bin/sh
mkdir /mmc
mount /dev/mmcblk1p1 /mmc/
cd /mmc/
cp /mnt/zImage .
cp /mnt/imx6ull-14x14-emmc-4.3-480x272-c.dtb .
cd /
umount /mmc
rm /mmc -r
