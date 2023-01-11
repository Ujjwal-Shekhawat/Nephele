#!/bin/bash
INSTANCE_PUBLIC_IP=$(curl ifconfig.me) WG_EASY_PASSWORD=$2 docker compose -f $1 up -d