#!/usr/bin/env bash

# Duzenleyen: Orkun Gunay
# Surum: 0.1
# Bu belgede router adli sanal makinanin ag ayarlari yapilandirilir.

# NIC isimlerini duzenleme
# enp0s3 <-> rg0
ip link set enp0s3 down
ip link set enp0s3 name rg0
ip link set rg0 up
# enp0s8 <-> rs0
ip link set enp0s8 down
ip link set enp0s8 name rs0
ip link set rs0 up

# NIC IP Adresi ekleme:
ip addr add 10.2.0.2/24 dev rg0
ip addr add 10.3.0.1/24 dev rs0

# Routing


# Iptables