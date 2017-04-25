#!/bin/bash
docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && docker-compose down"
git cmt && docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && git pull && docker-compose up -d"
docker-machine ssh ispconfig-machine docker exec ispconfig ps -ef
