#!/usr/bin/env bash

# Duzenleyen: Orkun Gunay
# Surum: 0.1
# Bu belgede client adli sanal makinanin ag ayarlari yapilandirilir.

# NIC isimlerini duzenleme 
# enp0s3 <-> cg0
ip link set enp0s3 down
ip link set enp0s3 name cg0
ip link set cg0 up

# NIC IP Adresi ekleme:
ip addr add 10.1.0.2/24 dev cg0

# Routing

# Iptables