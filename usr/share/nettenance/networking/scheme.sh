# scheme.sh

# Parses an URL.
#
# It's made with uri schema on mind, but thinking
# in ssh and scp too.
#
# Examples:
#
#
# txema:pass@192.168.1.2:80var2/www    <= A relative path of var2/www
# txema:pass@192.168.1.2:80/var2/www   <= Absolute path /var2/www
# txema:pass@192.168.1.2/var2/www
# txema:pass@192.168.1.2:~/var2/www    <= Relative paths enforces you to use port notation
#                                         (empty port here)
# Sample OUTPUT:
#
#  proto:
#  user: txema
#  pass: pass
#  host: 192.168.1.2
#  port: 80
#  path: ~/var2/www

parse-scheme() {
    local input=$1
    if [ -z $1 ]; then
        read -r input
    fi
    # extract the protocol
    proto="$(echo $input | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${input/$proto/})"
    # extract the user (if any)
    userpass="$(echo $url | grep @ | cut -d@ -f1)"
    pass=`echo $userpass | grep : | cut -d: -f2`
    if [ -n "$pass" ]; then
        user=`echo $userpass | grep : | cut -d: -f1`
    else
        user=$userpass
    fi
    # extract the host
    hostport=`echo $url | sed -e s,$userpass@,,g | cut -d/ -f1`
    port=`echo $hostport | grep : | cut -d: -f2`
    if [ -n "$port" ] || [[ "$hostport" =~ :  ]]; then
        host=`echo $hostport | grep : | cut -d: -f1`
    else
        host=$hostport
    fi
    # as long as localhost:~/pepe is a valid url, since used in scp
    # we stay that we are specifying (:) a missing port.
    # And also a relative url. Thus, we can end up with
    # localhost:89~/pepe. So we gotta rip ~ from 89.
    relative_path=$( echo "$port" | sed 's/^[0-9]\+//' )
    port=$( echo "${port/$relative_path}" )
    # relative_path=${relative_path:+$relative_path/}
    # extract the path (if any)
    path="$(echo -n $relative_path/; echo $url | grep / | cut -d/ -f2-)"

    echo "url: $url"
    echo "  proto: $proto"
    echo "  user: $user"
    echo "  pass: $pass"
    echo "  host: $host"
    echo "  port: $port"
    echo "  path: $path"
}

