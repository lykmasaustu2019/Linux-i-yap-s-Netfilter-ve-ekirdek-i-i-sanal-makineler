#-----interface isimleri-----
ip link set enp0s3 down
ip link set enp0s3 name sr0
#-----interface ipleri------
ip addr add 10.3.0.2/24 dev sr0
ip link set sr0 up
#------routing------
ip route add default via 10.3.0.1 dev sr0
#------iptabables------
