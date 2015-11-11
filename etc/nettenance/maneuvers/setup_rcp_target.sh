#!/bin/bash
# setup_rcp_target.sh

# $1: remote dir
# $2: netcating port

# Default port
PORT=$2
PORT=${PORT:-8901} # Avoid PORT=${3:-8901}, since
                   # load_script doesn't support it.

echo "TARGET MACHINE"
echo "=============="
echo

if [[ -e "$1" ]]; then
    echo "$1 ALREADY EXISTS!!. And contains:"
    echo
    echo -e "$( ls $1 )"
    echo
    read -r -p "Continue (Y/n): "
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "Nothing was written."
        exit 1
    fi
fi

echo "Creating dir $1."
mkdir -p $1
cd $1

echo "Connection started. Decompressing."
nc -l $PORT | pigz -d | tar xvf -

