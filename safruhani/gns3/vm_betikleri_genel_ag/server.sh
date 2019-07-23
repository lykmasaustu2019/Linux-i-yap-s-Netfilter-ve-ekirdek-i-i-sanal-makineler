#!/usr/bin/env bash

# Duzenleyen: safruhani
# Surum: 0.1
# Bu belgede server adli sanal makinanin ag ayarlari yapilandirilir.

# NIC isimlerini duzenleme
# enp0s3 <-> sr0
ip link set enp0s3 down
ip link set enp0s3 name sr0
ip link set sr0 up

# NIC IP Adresi ekleme:
ip addr add 10.2.0.2/24 dev sr0

# Routing

# Iptables