# scheme.sh

# Parses an URL.

parse-scheme() {
    # extract the protocol
    proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${1/$proto/})"
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
    if [ -n "$port" ]; then
        host=`echo $hostport | grep : | cut -d: -f1`
    else
        host=$hostport
    fi
    # extract the path (if any)
    path="$(echo $url | grep / | cut -d/ -f2-)"

    echo "url: $url"
    echo "  proto: $proto"
    echo "  user: $user"
    echo "  pass: $pass"
    echo "  host: $host"
    echo "  port: $port"
    echo "  path: $path"
}

parse-scp-scheme() {
    # extract the protocol
    proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${1/$proto/})"
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
    # extract the path (if any)
    path="$(echo $url | grep / | cut -d/ -f2-)"

    echo "url: $url"
    echo "  proto: $proto"
    echo "  user: $user"
    echo "  pass: $pass"
    echo "  host: $host"
    echo "  port: $port"
    echo "  path: $path"

}
