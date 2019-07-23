#!/usr/bin/env bash

# Duzenleyen: Orkun Gunay
# Surum: 0.1
# Bu belgede gateway adli sanal makinanin ag ayarlari yapilandirilir.

# NIC isimlerini duzenleme
# enp0s3 <-> gc0
ip link set enp0s3 down
ip link set enp0s3 name gc0
ip link set gc0 up
# enp0s8 <-> gr0
ip link set enp0s8 down
ip link set enp0s8 name gr0
ip link set gr0 up

# NIC IP Adresi ekleme:
ip addr add 10.1.0.1/24 dev gc0
ip addr add 10.2.0.1/24 dev gr0

# Routing


# Iptables