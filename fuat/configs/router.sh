#------interface isimleri------
ip link set enp0s8 down
ip link set enp0s3 down
ip link set enp0s3 name rs0
ip link set enp0s8 name rg0
#------interface ipleri-------
ip addr add 10.2.0.2/24 dev rg0
ip addr add 10.3.0.1/24 dev rs0
ip link set rs0 up
ip link set rg0 up
#-------routing--------
ip route add default via 10.2.0.1 dev rg0
#------iptabables-------
#----ek ayarlar-----
#/proc/sys/net/ipv4/ip_forward >>> 1
