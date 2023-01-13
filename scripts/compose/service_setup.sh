#!/bin/bash
INSTANCE_PUBLIC_IP=$(curl ifconfig.me) WG_EASY_PASSWORD=$2 CLOUDFLARE_API_TOKEN=$3 DOMAIN=$4 EMAIL=$5 docker compose -f $1 up -d
