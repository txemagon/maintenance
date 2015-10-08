#!/bin/bash
# remote_do.sh

# Oct, 2015
# txema.gonz@gmail.com

# Executes simultanousley several processes in background.
# Every command supplied feeds remote input, so there aren't
# any interacting possibilities (no remote configure).

# Usage: ./remote_do.sh <command_file>

# Note: Point with userhost.lst (symbolic link) to a file
# containing the hosts.

for ip in `cat userhost.lst`; do
	ssh root@$ip "bash -s" < $1 &
done

