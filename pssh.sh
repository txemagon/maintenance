#!/bin/bash
# pssh.sh

tmpdir=${TMPDIR:-/tmp}/pssh.$$
count=0
while read userhost; do
    ssh -n -o BatchMode=yes ${userhost} 'uname -a' > ${tmpdir}/${userhost} 2>&1 &
    count=`expr $count + 1`
done < userhost.lst
while [ $count -gt 0 ]; do
    wait $pids
    count=`expr $count - 1`
done
echo "Output for hosts are in $tmpdir"
