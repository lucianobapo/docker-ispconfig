#!/bin/bash

## prepare git
git cmt
docker-machine ssh ispconfig-machine "if [ -d /home/docker/docker-ispconfig/.git ]; then cd /home/docker/docker-ispconfig && git pull; fi"
docker-machine ssh ispconfig-machine "if [ ! -d /home/docker/docker-ispconfig ]; then cd /home/docker && git clone https://github.com/lucianobapo/docker-ispconfig.git; fi"
#
### prepare compose
docker-machine ssh ispconfig-machine "if [ ! -f /usr/local/bin/docker-compose ]; then sudo curl -o /usr/local/bin/docker-compose -L 'https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)'; fi"
docker-machine ssh ispconfig-machine "if [ -f /usr/local/bin/docker-compose ]; then sudo chmod ugo+x /usr/local/bin/docker-compose; fi"
#
docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && docker-compose down"
docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && docker-compose up -d --build"
#docker-machine ssh ispconfig-machine docker exec ispconfig service nginx restart
#docker-machine ssh ispconfig-machine docker exec ispconfig ps -ef
#docker-machine ssh ispconfig-machine docker exec ispconfig netstat -atunp

