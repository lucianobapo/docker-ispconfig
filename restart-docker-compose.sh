#!/bin/bash
docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && docker-compose down"
docker-machine ssh ispconfig-machine "if [ ! -d /usr/local/bin/docker-compose ]; then sudo curl -o /usr/local/bin/docker-compose -L 'https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)'; fi"
git cmt || true && docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && git pull || true && docker-compose up -d --build"
#docker-machine ssh ispconfig-machine docker exec ispconfig service nginx restart
#docker-machine ssh ispconfig-machine docker exec ispconfig ps -ef
#docker-machine ssh ispconfig-machine docker exec ispconfig netstat -atunp

