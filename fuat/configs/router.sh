#------interface isimleri------
ip link set enp0s8 down
ip link set enp0s3 down
ip link set enp0s9 down
ip link set enp0s3 name rs0
ip link set enp0s8 name rg0
ip link set enp0s9 name uplink
#------interface ipleri-------
ip addr add 10.2.0.2/24 dev rg0
ip addr add 10.3.0.1/24 dev rs0
ip addr add 10.201.102.2/24 dev uplink
ip link set rs0 up
ip link set rg0 up
ip link set uplink up
#-------routing--------
ip route add default via 10.2.0.1 dev rg0
#------iptabables-------
/sbin/iptables -t nat -A POSTROUTING -j SNAT --to-source 10.201.102.2
/sbin/iptables -t nat -A PREROUTING -i uplink -p tcp ---dport 80 -j DNAT --to-destination 10.3.0.2

#----ek ayarlar-----
#/proc/sys/net/ipv4/ip_forward >>> 1
