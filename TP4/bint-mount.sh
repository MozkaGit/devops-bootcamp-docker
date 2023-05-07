#!/bin/bash

# Cloner le code source du projet GitHub
git clone https://github.com/diranetafen/static-website-example.git

# Exécution du conteneur Apache2 webserver
# en montant le répertoire courant (où se trouve le code source cloné) dans le répertoire HTML du serveur web
docker run --name webserver -p 80:80 -d -v ${PWD}/static-website-example:/usr/local/apache2/htdocs/ httpd