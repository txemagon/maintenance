#!/bin/bash
# copy_credentials.sh

for ip in `cat ~/bin/mantenimiento/ordenadores_alumnos_inf1.txt`; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub root@$ip
done

