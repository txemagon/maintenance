#!/bin/bash
#ldap.sh

apt-get update
apt-get install libpam-ldap nscd -y

# Something went wrong?
# dpkg-reconfigure ldap-auth-config

sed -i 's/compat/compat ldap/' /etc/nsswitch.conf
echo "session required    pam_mkhomedir.so skel=/etc/skel umask=0022" >> /etc/pam.d/common-session

/etc/init.d/nscd restart




 
