FROM busybox:1.24.2

RUN mkdir -p /etc/nginx

COPY etc/nginx/crypt /etc/nginx/crypt

COPY etc/nginx/conf.d /etc/nginx/conf.d

#VOLUME /etc/nginx/crypt
#VOLUME /etc/nginx/conf.d
#VOLUME /var/log/nginx

CMD ["/bin/sh"]
