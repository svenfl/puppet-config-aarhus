#!/bin/bash
#https://github.com/ffnord/ffnord-puppet-gateway

VPN_NUMBER=4
DOMAIN="freemesh.dk"
TLD="fmdk"

##NGINX if needed to serve the firmware for the auto-updater
#apt-get install -y nginx

#mkdir /opt/www
#sed s~"usr/share/nginx/www;"~"opt/www;"~g -i /etc/nginx/sites-enabled/default

#DNS Server
echo "dns-search gw$VPN_NUMBER.$DOMAIN" >>/etc/network/interfaces

rm /etc/resolv.conf
cat >> /etc/resolv.conf <<-EOF
	domain $TLD
	search $TLD
	nameserver 127.0.0.1
	nameserver 213.133.98.98
	nameserver 213.133.99.99
	nameserver 213.133.100.100
	nameserver 8.8.8.8
EOF

# check if everything is running:
service fastd restart
service isc-dhcp-server restart
check-services
