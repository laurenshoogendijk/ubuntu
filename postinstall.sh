#!/bin/bash

# Ask for then set hostname
read -p "Hostname: " hostname
hostnameshort=$(echo $hostname | cut -f1 -d.)

hostnamectl set-hostname $hostname

echo "127.0.0.1 localhost
127.0.1.1 $hostname $hostnameshort

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters" > /etc/hosts

# Auto install packages
/bin/bash packages_install.sh