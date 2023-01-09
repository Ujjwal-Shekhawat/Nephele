#!/bin/bash
mkdir minecraft_server
cd minecraft_server
wget https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar
echo "eula=true" > eula.txt