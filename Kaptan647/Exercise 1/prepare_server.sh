#interface isimleri

ip link set enp0s3 down
ip link set enp0s3 name sr0
ip link set sr0 up

#interface ipleri

ip addr add 10.3.0.2/24 dev sr0

#routing

#iptables
