#!/bin/sh

CRYPT_DIR="nginx/etc/nginx/crypt"
mkdir -p ${CRYPT_DIR}
openssl genrsa -out ${CRYPT_DIR}/server.key 2048
openssl req -new -key ${CRYPT_DIR}/server.key  -out ${CRYPT_DIR}/server.csr  -subj "/C=IO/ST=Software Development/L=Continuous Integration/O=DevOps Corporation/OU=CI Team/CN=jenkins.intranet"
openssl x509 -signkey ${CRYPT_DIR}/server.key -in ${CRYPT_DIR}/server.csr -req -days 3650 -out  ${CRYPT_DIR}/server.crt

chmod 400 ${CRYPT_DIR}/*
