#!/bin/bash
# remote_dop.sh

# Oct, 2015
# txema.gonz@gmail.com

# Executes simultanousley several processes 
# (ONE WINDOW EACH) in background.
# Every command supplied feeds remote input, so there aren't
# any interacting possibilities (no remote configure).

# Usage: ./remote_dop.sh <command_file>

# Note: Point with userhost.lst (symbolic link) to a file
# containing the hosts

terminal="gnome-terminal"
option=" --tab -e "
s="'"
S="\""

command=$terminal
for ip in `cat userhost.lst`; do
	command+=$option$S
	command+="ssh root@$ip 'bash -s' < $1"
	command+=$S
done

eval $command


