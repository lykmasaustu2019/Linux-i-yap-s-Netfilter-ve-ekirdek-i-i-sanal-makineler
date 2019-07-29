#-----interface isimleri-----
ip link set enp0s3 down
ip link set enp0s3 name cg0
#-----interface ipleri------
ip addr add 10.1.0.2/24 dev cg0
ip link set cg0 up
#------routing-----
ip route add default via 10.1.0.1 dev cg0
#------iptabables-----
/sbin/iptables -P INPUT DROP
/sbin/iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT    #related
#-----ek ayarlar-------
#/etc/hosts   
#10.3.0.2	server
