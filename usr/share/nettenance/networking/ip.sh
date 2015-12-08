# Convert ip to int
# $1: ip
ip2int () {
	local a b c d
	{ IFS="." ; read a b c d; } <<< $1
	echo $(( (((a<<8) | b)<<8 | c)<<8 | d ))
}

# Convert int to ip
# $1: int representing ip
int2ip () {
	local ui32=$1; shift
	local ip n
	for n in 1 2 3 4; do
		ip=$(( ui32 & 0xff ))${ip:+.}$ip
		ui32=$(( ui32 >> 8 ))
	done
	echo $ip
}

# Print netmask
# $1: Number of masked bits
# Example: netmask 24 => 255.255.255.0
netmask () {
	local mask=$(( 0xffffffff << (32 - $1) ))
	shift
	int2ip $mask
}

# Calculate broadcast direction
# $1: Net address
# $2: Netmask
# Example: broadcast 192.168.1.5 24 => 192.168.1.255
broadcast () {
	local addr=$(ip2int $1); shift
	local mask=$(( 0xffffffff << (32 - $1) )); shift
	int2ip $(( addr | ~mask ))
}

# Print network base ip
# $1: net address
# $2: netmask
# Example: network 192.168.1.5 24 => 192.168.1.0
network () {
	local addr=$(ip2int $1); shift
	local mask=$(( 0xffffffff << (32 - $1) )); shift

	int2ip $(( addr & mask ))
}

# Print all ip's in a range
# $1: base ip - 192.168.1.0
# $2: netmask - 24
netrange() {
  local ntwrk=$( ip2int $(network $1 $2) )
  local brdcst=$( ip2int $(broadcast $1 $2) )
  local i
  for (( i = $ntwrk; i <= $brdcst; i++ )); do
  	int2ip i
  done
}