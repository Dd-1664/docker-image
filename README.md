#WEB SERVER APACHE2-PHP7 
Base image for all PHP 7.1 project.

*- HTTPS not activate - add KEYS & CERTS + enable SSL -*


DEBUG
======
If error on Deploy:

*- env: bash\r: No such file or directory -*

Run this command to convert endline DOS to UNIX for bash files:
`sed $'s/\r$//' ./script.sh > ./script.Unix.sh`


<https://stackoverflow.com/questions/29045140/env-bash-r-no-such-file-or-directory>


It Contains:

    PHP 7.1 + modules + .ini
    Apache2 + Configuration
    Deploy Script for Symfony


BUILD
=====
CMD:
docker build -t [NAME:TAG] .

PUSH
====
CMD:
docker push [NAMESPACE/NAME:TAG]

PULL
====
Exemple:
docker pull [NAMESPACE/NAME:TAG]



