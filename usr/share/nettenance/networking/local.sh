
# find the ip your using to connect to $1
my_ip_for () {
    ip -o route get $1 | \
    sed -n 's/.* src//p' - | \
    sed -n  's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/\nip&\n/gp' - | \
    grep ip | sed 's/ip//'| sort | uniq
}
