# injah/php7.1


DO NOT USE - FOR INTERNAL USAGE ONLY.
Base image for all PHP 7.1 project.
****

It Contains:

    PHP 7.1
    PHP modules
    PHP .ini
    Apache2
    Apache2 Configuration
    Deploy Script for Symfony


BUILD
=====

Dès que le repository est cloné, il faut build l'image (mettre le tag si possible).

CMD:
docker build -t [NAME:TAG] .


PUSH
====

Pour la commande `docker push` vers DockerHub, il faut la tagger correctement.

CMD:
docker push [NAMESPACE/NAME:TAG]

Si le push est refusé, changer le name de l'image par rapport au namespace DockerHub.

Exemple:
`-t injah/php7.1:latest`


PULL
====

Exemple:
`docker pull injah/php7.1`



