#!/bin/bash
# push.sh

# Usage:

for ip in `cat userhost.lst`; do
   scp repository/usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf root@$ip:/usr/share/lightdm/lightdm.conf.d/ &
done
