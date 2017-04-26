#rsync -rvztPhe ssh /home/luciano/configs/ froxlor.localhost.com:configs
#ssh froxlor.localhost.com
#sudo ln -s /home/luciano/configs/froxlor.localhost.com.localhost.com /etc/nginx/sites-enabled/froxlor.localhost.com && sudo service nginx reload


#rm froxlor.localhost.com-* && rm certindex.txt* && rm cacert.pem && rm private/cakey.pem
#touch certindex.txt

#openssl req -newkey rsa:2048 -x509 -extensions v3_ca -keyout private/cakey.pem -out cacert.pem -days 365 -config ./openssl.cnf
#chmod 777 -R /etc/sslcert
#chmod 700 -R /etc/sslcert

#sudo su
#cd /etc/sslcert
#openssl req -days 365 -newkey rsa:2048 -nodes -out froxlor.localhost.com-req.pem -keyout private/froxlor.localhost.com-key.pem -config ./openssl.cnf
#openssl ca -out froxlor.localhost.com-cert.pem -config ./openssl.cnf -infiles froxlor.localhost.com-req.pem
#cp froxlor.localhost.com-cert.pem /etc/ssl/froxlor.localhost.com.crt
#cp private/froxlor.localhost.com-key.pem /etc/ssl/froxlor.localhost.com.key
#service nginx reload

server {
    listen 80;
    server_name froxlor.localhost.com;
    return 301 https://froxlor.localhost.com;
}

server {
    # Port that the web server will listen on.
    #listen 80;

    # Host that will serve this project.
    server_name froxlor.localhost.com;

    listen       443 ssl;
    ssl          on;
    ssl_certificate      /etc/ssl/froxlor.localhost.com.crt;
    ssl_certificate_key  /etc/ssl/froxlor.localhost.com.key;
    #ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    #ssl_ciphers 'HIGH:!aNULL:!MD5:!kEDH';

    # Useful logs for debug.
    rewrite_log on;

    # The location of our projects public directory.
    root /home/luciano/code/froxlor;

    # Point index to the Laravel front controller.
    index index.php;

    location / {
        # URLs to attempt, including pretty ones.
        try_files $uri $uri/ /index.php?$query_string;
    }

    # Remove trailing slash to please routing system.
    if (!-d $request_filename) {
        rewrite ^/(.+)/$ /$1 permanent;
    }

    # PHP FPM configuration.
    include /home/luciano/configs/conf-fpm.conf;

    # We don't need .ht files with nginx.
    location ~ /\.ht {
            deny all;
    }

}