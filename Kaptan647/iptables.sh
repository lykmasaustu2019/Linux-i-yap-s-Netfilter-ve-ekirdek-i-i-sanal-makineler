# PREROUTING zincirinin raw tablosunda 80 portuna gelen tcp paketlerini düşür

iptables -t raw -A PREROUTING -p tcp --dport 80 -j DROP

#INPUT zincirinin filter(default) tablosunda 80 portuna gelen tcp paketlerini düşür

iptables -A INPUT -p tcp --dport 80 -j DROP

#OUTPUT zincirinin filter(default) tablosunda 80 portundan giden tcp paketlerini düşür

iptables -A OUTPUT -p tcp --sport 80 -j DROP

#PREROUTING zincirinin nat tablosunda 80 portuna gelen tcp paketlerini 1.1.1.1 iipsine yönlendir
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 1.1.1.1

#INPUT zincirinde 80 portuna gelen tcp paketlerini BLOCKER zincirine gönder ve düşür

iptables -N BLOCKER
iptables -A INPUT -p tcp --dport 80 -j BLOCKER
iptables -A BLOCKER -j DROP

#Custom zincire zincir bağla

iptables -N BLOCKER
iptables -A INPUT -p tcp --dport 80 -j BLOCKER
iptables -A BLOCKER -j BLOCKERV2
iptables -N BLOCKERV2
iptables -A BLOCKERV2 -j DROP

#INPUT zincirinde 80 portuna gelen tcp paketlerini rejectle

iptables -A INPUT -p tcp --dport 80 -j REJECT

