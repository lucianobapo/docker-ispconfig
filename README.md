# docker-ispconfig

docker images |awk '{print $3}'

$(docker images |awk '{print $3}')

docker volume rm $(docker volume ls |awk '{print $2}')

git cmt && docker-machine ssh "docker-compose down && git pull && docker-compose up -d"

