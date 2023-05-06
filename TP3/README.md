## Module Docker · TP3

Ce TP consiste à créer un réseau Docker en mode bridge puis d'y rattacher deux conteneurs afin de faire des tests de connectivité (ping). Pour faciliter le processus j'ai mis en place un script qui s'occupe de tout déployer. Il ne restera que le test ping a effectuer.
Je vais tout de même indiquer les étapes ci-dessous.

#### Étape 1 : Création du réseau en mode bridge

```docker network create --driver=bridge --subnet=192.168.2.0/24 network-bridge```

#### Étape 2 : Création et rattachement de deux containers au réseau bridge

```docker run -it --name ubuntu1 --network network-bridge -d ubuntu /bin/bash```
```docker run -it --name ubuntu2 --network network-bridge -d ubuntu /bin/bash```

#### Étape 3 : Installation de ***iputils-ping*** sur les deux containers
```docker exec -it ubuntu1 /bin/bash -c "apt-get update && apt-get install -y iputils-ping"```
```docker exec -it ubuntu2 /bin/bash -c "apt-get update && apt-get install -y iputils-ping"```

#### Étape 4 : Test de connectivité

Se connecter sur chaque containers grâce à la commande `docker exec -it (nom-du-container) /bin/bash` puis utiliser la commande `ping (hostname)`.

Voici ce que devrait retourner la commande `ping (hostname)`:

```bash
PING ubuntu2 (192.168.2.3) 56(84) bytes of data.
64 bytes from ubuntu2.network-bridge (192.168.2.3): icmp_seq=1 ttl=64 time=0.040 ms
64 bytes from ubuntu2.network-bridge (192.168.2.3): icmp_seq=2 ttl=64 time=0.046 ms
64 bytes from ubuntu2.network-bridge (192.168.2.3): icmp_seq=3 ttl=64 time=0.045 ms
64 bytes from ubuntu2.network-bridge (192.168.2.3): icmp_seq=4 ttl=64 time=0.051 ms
```
