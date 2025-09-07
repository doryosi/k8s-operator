#!/usr/bin/env bash
# This script deploys the wg-easy WireGuard server in a Docker container

set -euo pipefail

#SERVER_IP=$(curl -s ifconfig.me)
SERVER_IP=164.92.237.213
UI_ADMIN_PASSWORD="admin"

docker run -d \
  --name=wg-easy \
  -e WG_HOST=${SERVER_IP} \
  -e PASSWORD=${UI_ADMIN_PASSWORD} \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy