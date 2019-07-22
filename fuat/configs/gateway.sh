#-----interface isimleri------
ip link set enp0s3 down
ip link set enp0s8 down
ip link set enp0s3 name gc0
ip link set enp0s8 name gr0

#-----interface ipleri------
ip addr add 10.1.0.1/24 dev gc0
ip addr add 10.2.0.1/24 dev gr0
ip link set gc0 up
ip link set gr0 up

#------routing-----

#------iptabables-----