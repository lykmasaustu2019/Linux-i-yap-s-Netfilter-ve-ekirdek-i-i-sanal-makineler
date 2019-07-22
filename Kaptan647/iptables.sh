# PREROUTING zincirinin raw tablosunda 80 portuna gelen tcp isteklerini düşür
iptables -t raw -I PREROUTING -p tcp --dport 80 -j DROP

iptables -I INPUT -p tcp --dport 80 -j DROP
iptables -I OUTPUT -p tcp --sport 80 -j DROP
iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT --to-destination 1.1.1.1

iptables -N BLOCKER
iptables -P BLOCKER DROP
iptables -A INPUT -p tcp --dport 80 -j BLOCKER
iptables -N BLOCKERv2
iptables -P BLOCKERV2 DROP
iptables -A BLOCKER -p tcp --dport 80 -j BLOCKERv2

iptables -I INPUT -p tcp --dport 80 -j REJECT

