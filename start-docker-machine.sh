#!/bin/bash
# DOCKERPASS=$(openssl rand -base64 32)
# echo "ROOT password : $DOCKERPASS"
# echo "root:pass"|chpasswd
# sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
#if [ ! -z "$DEFAULT_EMAIL_HOST" ]; then
#sed -i "s/^\(DEFAULT_EMAIL_HOST\) = .*$/\1 = '$MAILMAN_EMAIL_HOST'/g" /etc/mailman/mm_cfg.py
#newlist -q mailman $(MAILMAN_EMAIL) $(MAILMAN_PASS)
#newaliases
#fi
#echo "START"
#if [ ! -z "$LANGUAGE" ]; then
#sed -i "s/^language=en$/language=$LANGUAGE/g" /tmp/ispconfig3_install/install/autoinstall.ini
#fi
#if [ ! -z "$COUNTRY" ]; then
#sed -i "s/^ssl_cert_country=AU$/ssl_cert_country=$COUNTRY/g" /tmp/ispconfig3_install/install/autoinstall.ini
#fi
#if [ ! -z "$HOSTNAME" ]; then
#sed -i "s/^hostname=server1.example.com$/hostname=$HOSTNAME/g" /tmp/ispconfig3_install/install/autoinstall.ini
#fi
# php -q /tmp/ispconfig3_install/install/install.php --autoinstall=/tmp/ispconfig3_install/install/autoinstall.ini
#/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
#rsync -rvztPhe "ssh docker@$(docker-machine ip ispconfig-machine)" /home/luciano/code/docker-ispconfig/ $(docker-machine ip ispconfig-machine):/home/docker/docker-ispconfig/
#ping $(docker-machine ip ispconfig-machine)
git cmt

docker-machine ssh ispconfig-machine "sudo curl -o /usr/local/bin/docker-compose -L 'https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)'"
docker-machine ssh ispconfig-machine "sudo chmod +x /usr/local/bin/docker-compose"
#docker-machine ssh ispconfig-machine "curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose | sudo -i"
docker-machine ssh ispconfig-machine "cd /home/docker && git clone https://github.com/lucianobapo/docker-ispconfig.git || true && cd /home/docker/docker-ispconfig && git pull && docker-compose down && docker-compose up -d"
#if [ ! -f /home/luciano/code/docker-ispconfig ]; then
#pwd
#fi
