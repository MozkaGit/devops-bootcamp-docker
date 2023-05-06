#!/bin/bash

# Création d'un réseau docker en mode bridge
docker network create --driver=bridge --subnet=192.168.2.0/24 network-bridge

# Création et rattachement de deux containers Ubuntu à network-bridge
docker run -it --name ubuntu1 --network network-bridge -d ubuntu /bin/bash
docker run -it --name ubuntu2 --network network-bridge -d ubuntu /bin/bash

# Installation de iputils-ping sur les 2 containers
docker exec -it ubuntu1 /bin/bash -c "apt-get update && apt-get install -y iputils-ping"
docker exec -it ubuntu2 /bin/bash -c "apt-get update && apt-get install -y iputils-ping"
