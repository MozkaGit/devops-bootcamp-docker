#!/bin/bash

# Créer un volume Docker nommé "nas"
docker volume create --name nas

# Exécution des conteneurs
# en attachant le volume "nas" au répertoire "/tmp" des conteneurs
docker run -it --name ubuntu1 -d -v nas:/tmp -d ubuntu /bin/bash
docker run -it --name ubuntu2 -d -v nas:/tmp -d ubuntu /bin/bash

# Modification de "/tmp/mozkagit.txt" dans le 1er conteneur
docker exec -it ubuntu1 /bin/bash -c "echo 'MozkaGit, étudiant de la 13e promo du bootcamp Eazytraining.' > /tmp/mozkagit.txt"