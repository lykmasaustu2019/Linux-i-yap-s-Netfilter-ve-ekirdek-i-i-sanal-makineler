#interface isimleri

ip link set enp0s3 down
ip link set enp0s8 down
ip link set enp0s9 down
ip link set enp0s3 name rg0
ip link set enp0s8 name rs0
ip link set enp0s9 name uplink
ip link set rg0 up
ip link set rs0 up
ip link set uplink up

#interface ipleri

ip addr add 10.2.0.2/24 dev rg0
ip addr add 10.3.0.1/24 dev rs0
ip addr add 10.201.102.6/24 dev uplink

#routing

ip route add default via 10.2.0.1 dev rg0
sysctl net.ipv4.ip_forward=1

#iptables

iptables -t nat -A PREROUTING -d 10.201.102.6 -p tcp --dport 80 -j DNAT --to-destination 10.3.0.2
iptables -t nat -A POSTROUTING -d 10.201.102.0/24 -j MASQUERADE

