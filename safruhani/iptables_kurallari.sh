sudo /usr/sbin/iptables              \
  --flush 

sudo /usr/sbin/iptables              \
  --append INPUT                     \
  --protocol tcp                     \
  --destination 127.0.0.1/8          \
  --destination-port 80	             \
  --jump DROP


sudo /usr/sbin/iptables              \
  --append OUTPUT                    \
  --protocol tcp                     \
  --destination 127.0.0.1/8          \
  --destination-port 80	             \
  --jump DROP

sudo /usr/sbin/iptables              \
  --append PREROUTING                \
  --table raw                        \
  --protocol tcp                     \
  --destination 127.0.0.1/8          \
  --destination-port 80	             \
  --jump DROP                    

sudo /usr/sbin/iptables              \
  --append PREROUTING                \
  --table nat                        \
  --protocol tcp                     \
  --jump DNAT                        \
  --to-destination 127.0.0.1     

sudo /usr/sbin/iptables              \
  --new-chain DROP_WEB               \

sudo /usr/sbin/iptables              \
  --append DROP_WEB                  \
  --protocol tcp                     \
  --destination 127.0.0.1            \
  --destination-port 80              \
  --jump DROP

sudo /usr/sbin/iptables              \
  --append INPUT                     \
  --jump DROP_WEB

sudo /usr/sbin/iptables              \
  --new-chain DROP_WEB2

sudo /usr/sbin/iptables              \
  --append DROP_WEB2                 \
  --protocol tcp                     \
  --destination 127.0.0.1            \
  --destination-port 80              \
  --jump DROP

sudo /usr/sbin/iptables              \
  --append DROP_WEB                  \
  --jump DROP_WEB2


sudo /usr/sbin/iptables              \
  --append INPUT                     \
  --protocol tcp                     \
  --destination 127.0.0.1            \
  --destination-port 80              \
  --jump REJECT
