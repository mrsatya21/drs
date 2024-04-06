#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo -e "Please execute this script using 'sudo' or with user 'root'"
   exit 1
fi


echo -e "Gathering info"

echo -e "Attempt `date +"%y-%m-%d-%T"`" >> /tmp/ce_multi.log  2>&1

echo -e "Boot device is:" >> /tmp/ce_multi.log  2>&1
fdisk -l | grep '^/dev/[a-z]*[0-9]' | awk '$2 == "*"' >> /tmp/ce_multi.log  2>&1

echo -e "PV Names are:" >> /tmp/ce_multi.log  2>&1
pvdisplay | grep  "PV Name" >> /tmp/ce_multi.log  2>&1

echo -e "Rest of the info to confirm:" >> /tmp/ce_multi.log  2>&1
echo -e "lsblk -f:\n"  >> /tmp/ce_multi.log  2>&1
lsblk -f >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "fdisk -l:\n"  >> /tmp/ce_multi.log  2>&1
fdisk -l >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "blkid:\n"  >> /tmp/ce_multi.log  2>&1
blkid >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "mount:\n"  >> /tmp/ce_multi.log  2>&1
mount >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "pvdisplay -vv:\n"  >> /tmp/ce_multi.log  2>&1
pvdisplay -vv  >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "vgdisplay -v:\n"  >> /tmp/ce_multi.log  2>&1
vgdisplay -v >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "ls -lart /dev:\n"  >> /tmp/ce_multi.log  2>&1
ls -lart /dev >> /tmp/ce_multi.log  2>&1
echo -e "ls -lartR /dev/mpath:\n" >> /tmp/ce_multi.log  2>&1
ls -lartR /dev/mpath >> /tmp/ce_multi.log  2>&1
echo -e "ls -lartR /dev/mapper:\n" >> /tmp/ce_multi.log  2>&1
ls -lartR /dev/mapper >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "multipath -ll:\n"  >> /tmp/ce_multi.log  2>&1
multipath -ll  >> /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "df -h:\n"  >> /tmp/ce_multi.log  2>&1
df -h >>  /tmp/ce_multi.log  2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1
echo -e "powermt display dev=all:\n"  >> /tmp/ce_multi.log  2>&1
powermt display dev=all  >> /tmp/ce_multi.log 2>&1
echo -e "\n" >> /tmp/ce_multi.log  2>&1


echo -e "Finished gathering info - Please attach /tmp/ce_multi.log to the Support ticket" 
