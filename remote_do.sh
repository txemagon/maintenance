#!/bin/bash
# remote_install.sh

for ip in `cat ~/bin/mantenimiento/ordenadores_alumnos_inf1.txt`; do
	ssh root@$ip "bash -s" < $1 &
done

