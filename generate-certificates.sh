#!/bin/bash

#create CA key
openssl genrsa -out ca-key.pem 2048
#create CA wildcard certificate
openssl req -subj '/CN=*/' -new -x509 -days 3650 -key ca-key.pem -out ca-certificate.pem

#-----------generate server key and certificate
#create server key
openssl genrsa -out server-key.pem 2048
#create server certificate request
openssl req -new -key server-key.pem -out server-csr.pem -subj '/CN=*/'
#create server certificate  signed by CA certificate
openssl x509 -req -days 1500 -in server-csr.pem -CA ca-certificate.pem -CAkey ca-key.pem -out server-certificate.pem -set_serial 1


#-----------generate client key and certificate
#create client-key
openssl genrsa -out client-key.pem 2048

# generate client certificate
openssl req -subj '/CN=client' -new -key client-key.pem -out client-csr.pem
#we need a file with extensions saying that we can use sertificate for client authentication (it is impossible to pass this information with other means)

echo extendedKeyUsage = clientAuth > client-extention.cnf
openssl x509 -req -days 1500 -in client-csr.pem -CA ca-certificate.pem -CAkey ca-key.pem -out client-certificate.pem -extfile client-extention.cnf -set_serial 2

#cleanup
rm -f server-csr.pem client-csr.pem client-extextention.cnf
