#!/bin/bash
mkdir minecraft_server
cd minecraft_server
wget https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar
echo "eula=true" > eula.txt

echo "FROM openjdk:19

WORKDIR /server

COPY . .

EXPOSE 25565/tcp

EXPOSE 25565/udp

EXPOSE 25575/tcp

CMD [\"java\", \"-jar\", \"-Xmn9G\", \"-Xmx18G\", \"server.jar\", \"nogui\"]" > Dockerfile

echo "version: \"3.9\"
services:
  minecraft:
    image: minecraft
    container_name: minecraft
    stdin_open: true
    restart: unless-stopped
    tty: true
    ports:
      - 25565:25565
      - 25575:25575
    volumes:
      - minecraft_data:/server
volumes:
  minecraft_data:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ${HOME}/minecraft_server

networks:
  proxy:
    name: proxy" > docker-compose.yml

docker build -t minecraft .
docker compose up -d