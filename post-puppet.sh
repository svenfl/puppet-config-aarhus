#!/bin/bash
#https://github.com/ffnord/ffnord-puppet-gateway

VPN_NUMBER=0
DOMAIN="freemesh.dk"
TLD="fmdk"

##NGINX if needed:
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
	nameserver 62.141.32.5
	nameserver 62.141.32.4
	nameserver 62.141.32.3
	nameserver 8.8.8.8
EOF

