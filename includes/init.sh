#!/bin/sh
SIZE_LIMIT=${SIZE_LIMIT:-'1G'}

sed -i "s/client_max_body_size 1G/client_max_body_size ${SIZE_LIMIT}/g" /etc/nginx/conf.d/default.conf

chown -R nobody:nogroup ${JF_ROOT_DIR}
chown -R nobody:nogroup ${JF_DATA_DIR}
chmod -R g+w,o+rwx ${JF_DATA_DIR}
mkdir ${JF_DATA_DIR}/files
mkdir ${JF_DATA_DIR}/links
mkdir ${JF_DATA_DIR}/async
cd ${JF_ROOT_DIR}
supervisord -c /usr/local/etc/supervisord.conf &
sleep 5
tail -f /supervisord.log /var/log/nginx/jirafeau_access.log /var/log/nginx/jirafeau_error.log /var/log/nginx/jirafeau.access.log