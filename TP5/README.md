## Module Docker · TP5

Ce TP consiste à déploiyer une instance Odoo et une base de données PostgreSQL à l'aide de Docker Compose.

#### Étape 1 : Création du docker compose

1. On crée d'abord le fichier yml.
2. Voici les instructions à renseigner dans le yml: [cliquez ici.](https://github.com/MozkaGit/devops-bootcamp-docker/blob/f6b59e65115c8f3e156b49702e714f7b6efcf48a/TP5/odoo.yml)

#### Étape 2 : Démarrage des conteneurs
1. Exécutez la commande suivante pour démarrer les conteneurs Odoo et PostgreSQL : 

```docker compose -f odoo.yml up -d```

<sub>*Si votre fichier yml se nomme autrement que docker-compose.yml il faut alors utiliser l'argument -f et préciser le nom du fichier.*<sub>

#### Étape 3 : Vérifications du réseau utilisé par les conteneurs

1. Avec la commande suivante (à réaliser pour les deux conteneurs):

`docker inspect <nom ou ID du conteneur> | grep -i network`

2. Les résultats devraient être les suivants :

```
[vagrant@docker TP5]$ docker inspect tp5-web-1 | grep -i network
            "NetworkMode": "tp5_odoo_network",
        "NetworkSettings": {
            "Networks": {
                "tp5_odoo_network": {
                    "NetworkID": "07e593ad55b4144c38ca350058eca7e40adfbdd291340132ce2f5d31db38548d"
```

On constate que notre réseau est bien odoo_network et qu'ils ont le même **NetworkID**.

#### Étape 4 : Accès à l'interface web

Accédez à l'interface Web d'Odoo en ouvrant un navigateur Web et en accédant à l'URL suivante : http://votre-ip/ (on ne précise pas de ports car l'énoncé stipule qu'il faut accéder à Odoo via le port 80)

*<small>Image à venir</small>*


----

### Précisons

1. Explication du fichier yml:

*À venir*

2. Lors de la première utilisation de l'application, il faudra la configurer en fournissant des informations de base telles que le nom de l'entreprise, la langue par défaut, etc.
3. Une fois la configuration terminée, il sera possible d'utiliser Odoo pour gérer notre entreprise.