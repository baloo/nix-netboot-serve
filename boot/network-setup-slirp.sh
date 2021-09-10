#!/bin/sh

target_tap=tap42

# Wait for tap interface
while [ 1 ]; do
  ip link show dev $target_tap
  if [ $? = 0 ]; then
    break;
  fi
  sleep 0.4;
done

# Wait for bridge interface
while [ 1 ]; do
  ip link show dev br0
  if [ $? = 0 ]; then
    break;
  fi
  sleep 0.4;
done

set -eux

ip link set dev $target_tap master br0
ip link set dev $target_tap up

# slirp4netns can't provide a next boot
nft "add table netdev foo; add chain netdev foo nodhcp { type filter hook ingress device $target_tap priority 0; policy accept; }"
nft add rule netdev foo nodhcp udp sport 67 drop


sleep infinity
