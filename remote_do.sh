#!/bin/bash
# remote_do.sh

for ip in `cat userhost.lst`; do
	ssh root@$ip "bash -s" < $1 &
done

