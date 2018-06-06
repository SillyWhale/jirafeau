#!/bin/sh
chown -R nobody:nogroup ${JF_ROOT_DIR}
chown -R nobody:nogroup ${JF_DATA_DIR}
cd ${JF_ROOT_DIR}
supervisord -c /usr/local/etc/supervisord.conf &
sleep 5
tail -f /supervisord.log /var/log/nginx/jirafeau_access.log /var/log/nginx/jirafeau_error.log /var/log/nginx/nextcloud.access.log