FROM alpine:3.7
LABEL maintainer="Vincent FRICOU <vincent@fricouv.eu>"

ENV JF_VERSION=3.4.1
ENV JF_URL=https://gitlab.com/mojo42/Jirafeau
ENV JF_ROOT_DIR=/Jirafeau
ENV JF_DATA_DIR=/jirafeau-data

RUN \
  apk update && apk upgrade && \
  apk add nginx supervisor git && \
  apk add php7-fpm php7-session php7-json && \
  rm /etc/nginx/conf.d/default.conf && \
  rm /etc/php7/php-fpm.d/www.conf && \
  mkdir /run/nginx/ && \
  echo 'daemon off;' >> /etc/nginx/nginx.conf

RUN \
  git clone ${JF_URL} && \
  cd ${JF_ROOT_DIR} && git checkout tags/${JF_VERSION}


COPY includes/nginx.conf /etc/nginx/conf.d/nextcloud.conf
COPY includes/php7-fpm.conf /etc/php7/php-fpm.d/nextcloud.conf
COPY includes/supervisord.conf /usr/local/etc/supervisord.conf
COPY includes/init.sh /init.sh

RUN  \
  chmod +x /init.sh && \ 
  rm -rf /var/cache/apk/*
  
EXPOSE 80

ENTRYPOINT [ "/init.sh" ]