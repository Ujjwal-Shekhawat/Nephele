#!/bin/bash
INSTANCE_PUBLIC_IP=$(curl ifconfig.me) \
DOCKER_USER="$(id -u):$(id -g)" \
docker compose --env-file /data/.env -f /data/docker-compose.yml up -d
