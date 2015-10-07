#!/bin/bash
# remote_dop.sh

terminal="gnome-terminal"
option=" --tab -e "
s="'"
S="\""

command=$terminal
for ip in `cat ordenadores_alumnos_inf1.txt`; do
	command+=$option$S
	command+="ssh root@$ip 'bash -s' < $1"
	command+=$S
done

eval $command


