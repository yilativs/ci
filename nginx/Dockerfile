FROM nginx:1.10.1

RUN mkdir -p /etc/nginx

COPY etc/nginx/ssl /etc/nginx/ssl
COPY etc/nginx/ssl/ca.crt  /usr/local/share/ca-certificates

COPY etc/nginx/conf.d /etc/nginx/conf.d



#VOLUME /etc/nginx/crypt
#VOLUME /etc/nginx/conf.d
#VOLUME /var/log/nginx

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT  update-ca-certificates ; nginx -g "daemon off;"
#ENTRYPOINT  ["sh", "-c", "update-ca-certificates", "&&", "nginx", "-g", "daemon off;"]
