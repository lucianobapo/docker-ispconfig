# docker-ispconfig

free -m

cat /etc/issue

docker images |awk '{print $3}'

docker rmi $(docker images |awk '{print $3}')

docker kill $(docker ps |awk '{print $1}')

docker volume rm $(docker volume ls |awk '{print $2}')

git cmt && docker-machine ssh ispconfig-machine "cd ~/docker-ispconfig  && git pull && docker-compose down && docker-compose up -d"

docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && docker-compose down"
git cmt && docker-machine ssh ispconfig-machine "cd /home/docker/docker-ispconfig && git pull && docker-compose up -d"

docker-machine ssh ispconfig-machine docker exec ispconfig ps -ef

docker-machine ssh ispconfig-machine docker exec ispconfig netstat -atunp