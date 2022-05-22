#!/bin/bash
apt-get -y update

# install and configure bind9 dns service
apt install bind9 -y
systemctl restart bind9.service

# install dnsutils for testing DNS
apt install dnsutils -y

# add the DNS zones
curl https://raw.githubusercontent.com/davidokeyode/AZ-700/main/chapter-2/template/bindconfig -o /etc/bind/named.conf.local

# add the zone file
curl https://raw.githubusercontent.com/davidokeyode/AZ-700/main/chapter-2/template/zonefile -o /etc/bind/db.internal.charistech.xyz

# add the reverse zone file
curl https://raw.githubusercontent.com/davidokeyode/AZ-700/main/chapter-2/template/reversezonefile -o /etc/bind/db.10.10.reverse

# restart the DNS service
systemctl restart bind9.service