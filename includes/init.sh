#!/bin/sh
SIZE_LIMIT=${SIZE_LIMIT:-'100M'}
PURGE_ENABLED=${PURGE_ENABLED:-'false'}
JF_CIPHER=${JF_CIPHER:-''}

sed -i "s/client_max_body_size 1G/client_max_body_size ${SIZE_LIMIT}/g" /etc/nginx/conf.d/default.conf

if [ "${PURGE_ENABLED}" == 'true' && ! -f "/runned_once" ]
then
    echo '00 00 * * * php /Jirafeau/admin.php clean_expired' >> /etc/crontabs/root
    echo '00 00 * * * php /Jirafeau/admin.php clean_async' >> /etc/crontabs/root
fi

if [ "${JF_CIPHER}" != '' ]
then
    sed -i "s/rijndael-256/${JF_CIPHER}/g" /Jirafeau/lib/functions.php
    sed -i "s/rijndael-256/${JF_CIPHER}/g" /Jirafeau/f.php
fi

mkdir ${JF_DATA_DIR}/files
mkdir ${JF_DATA_DIR}/links
mkdir ${JF_DATA_DIR}/async
chown -R nobody:nogroup ${JF_ROOT_DIR}
chown -R nobody:nogroup ${JF_DATA_DIR}
find ${JF_DATA_DIR} -type f -exec chmod g+w,o+rw {} \;
find ${JF_DATA_DIR} -type d -exec chmod g+w,o+rwx {} \;
cd ${JF_ROOT_DIR}
supervisord -c /usr/local/etc/supervisord.conf &
touch /runned_once
sleep 5
tail -f /supervisord.log /var/log/nginx/jirafeau_access.log /var/log/nginx/jirafeau_error.log /var/log/nginx/jirafeau.access.log