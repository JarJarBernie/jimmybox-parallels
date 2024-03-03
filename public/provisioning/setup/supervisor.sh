#!/bin/sh

sudo apt-get update
sudo apt-get install supervisor

# mailjerry conf
sudo vim /etc/supervisor/conf.d/mailjerry.conf
#########
[program:mailjerry]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/worker.mailjerry.com/artisan queue:work --sleep=0 --tries=0 --timeout=0 --daemon
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=www-data
numprocs=1
redirect_stderr=true
stdout_logfile=/var/www/worker.mailjerry.com/storage/logs/supervisor.log
stopwaitsecs=0
##########

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start mailjerry:*
sudo supervisorctl restart mailjerry:*
sudo supervisorctl status
