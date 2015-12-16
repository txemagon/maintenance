#/bin/bash
# Setup the source machine to open
# a netcat and start pushing data through
# it.


# $1: Path to the directory to copy
# $2: ip to connet
# $3: port for netcating.

# Default port
PORT=$3
PORT=${PORT:-8901}  # Avoid PORT=${2:-8901}, since
                    # load_script does not support it.

echo "SOURCE MACHINE"
echo "=============="
echo

pushd $1
cd ..
BASEDIR=$(pwd) # Base de directory.
            # The place we are going to commpress from.
echo "$BASEDIR entered."
HPATH=$1
TARGETDIR="${HPATH##$BASEDIR/}"

read -r -p "Press any key when target machine is ready to start. "
echo "Connection started. Compressing and transferring $(du -sh $TARGETDIR | cut -f1 )."
tar -c $TARGETDIR | pv | pigz -5 | nc $2 $PORT
echo 'Back to: '
popd


# Aditional notes.
# Pushing and poping is usually not necessary since commands,
# like setup_rcp-dir_sr.sh are normally executed in a subshell.


