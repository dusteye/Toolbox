while true
do
	read IP # Read rfom stdin
	test -z "$IP" && break
	IP="0x"`printf '%02x' ${IP//./ }; echo` # Convert IP address to hex
	CMD='iptables -I INPUT -p udp -m udp --sport 53 -m u32 --u32 "0&0x0F000000=0x05000000 && 22&0xFFFF@16='$IP'" -j DROP'
	eval $CMD
done