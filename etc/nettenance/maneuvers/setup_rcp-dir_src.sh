#/bin/bash
# Setup the source machine to open
# a netcat and start pushing data through
# it.


# $1: Path to the directory to copy
# $2: port for netcating
pushd $1
cd ..
BASEDIR=$(pwd) # Base de directory.
            # The place we are going to commpress from.
TARGETDIR="${1##$BASEDIR/}"

tar -c $TARGETDIR | pv --size $( du -sb $BASEDIR | cut -f1 ) | pigz -5 | nc -l $2
echo 'Back to: '
popd


# Aditional notes.
# Pushing and poping is usually not necessary since commands,
# like setup_rcp-dir_sr.sh are normally executed in a subshell.


