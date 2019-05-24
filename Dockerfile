FROM alpine:3.8
LABEL maintainer="SillyWhale <contact@sillywhale.wtf"

ENV JF_VERSION=3.4.1 \
    JF_URL=https://gitlab.com/mojo42/Jirafeau \
    JF_ROOT_DIR=/Jirafeau \
    JF_DATA_DIR=/jirafeau-data

COPY includes/ /includes.d

RUN \
  apk update && apk upgrade && \
  apk add --no-cache nginx supervisor git && \
  apk add --no-cache php7-fpm php7-session php7-json php7-mcrypt php7-xdebug php7-cli && \
  rm /etc/nginx/conf.d/default.conf && \
  rm /etc/php7/php-fpm.d/www.conf && \
  mkdir /run/nginx/ && \
  echo 'daemon off;' >> /etc/nginx/nginx.conf && \
  git clone ${JF_URL} && \
  cd ${JF_ROOT_DIR} && \
  git checkout tags/${JF_VERSION} && \
  cp /includes.d/nginx.conf /etc/nginx/conf.d/default.conf && \
  cp /includes.d/php7-fpm.conf /etc/php7/php-fpm.d/jirafeau.conf && \
  mkdir /usr/local/etc && \
  cp /includes.d/supervisord.conf /usr/local/etc/supervisord.conf && \
  cp /includes.d/init.sh /init.sh  && \
  chmod +x /init.sh && \
  rm -rf /includes.d/ && \
  apk del git
  
EXPOSE 80

ENTRYPOINT [ "/init.sh" ]