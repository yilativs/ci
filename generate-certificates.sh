#!/bin/bash

#create CA key
openssl genrsa -out ca.key 2048
#create CA wildcard certificate
#req - create certificate request
#-x509 - outputs a self signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self signed root CA.
#-new this option generates a new certificate reques (If the -key option is not used it will generate a new RSA private key using information specified in the configuration file.)
#-days n when the -x509 option is being used this specifies the number of days to certify the certificate for. The default is 30 days.

openssl req -x509 -new -days 3650 -key ca.key -out ca.crt  -extensions v3_ca -subj "/C=IO/ST=Clouderia/L=Cloudville/O=ZDevOps4You/OU=CI Team/CN=dev.intranet"

#-----------generate server key and certificate
#create server key
openssl genrsa -out server.key 2048


#create server certificate request
openssl req -new -key server.key -out server.csr  -subj "/C=IO/ST=Clouderia/L=Cloudville/O=ZDevOps4You/OU=CI Team/CN=build.dev.intranet"
#create server certificate  signed by CA certificate
#x509  used to display certificate information, convert certificates to various forms, sign certificate requests like a "mini CA" or edit certificate trust settings.
#-req by default a certificate is expected on input. With this option a certificate request is expected instead.
#--set_serial n specifies the serial number to use. This option can be used with either the -signkey or -CA options. If used in conjunction with the -CA option the serial number file (as specified by the -CAserial or -CAcreateserial options) is not used.
#-CA  specifies the CA certificate to be used for signing. When this option is present x509 behaves like a "mini CA". The input file is signed by this CA using this option: that is its issuer name is set to the subject name of the CA and it is digitally signed using the CAs private key.
#when -CA is used -CAserial should be used as well

#since we can not create wildcard certificate that includes domain itself we have to introudce a subjectAltName and pass it via -extfile
echo "subjectAltName = DNS:*.dev.intranet, DNS:dev.intranet" > server-ext.cnf
openssl x509 -req -days 1500 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -set_serial $RANDOM -extfile server-ext.cnf -out server.crt


#-----------generate client key and certificate
#create client-key
#openssl genrsa -out client.key 2048

# generate client certificate
#openssl req -subj '/CN=client' -new -key client.key -out client.csr
#we need a file with extensions saying that we can use sertificate for client authentication (it is impossible to pass this information with other means)

#echo extendedKeyUsage = clientAuth > client-extention.cnf
#openssl x509 -req -days 1500 -in client.csr -CA ca.crt -CAkey ca.key -out client.crt -extfile client-extention.cnf -set_serial $RANDOM

#cleanup
#rm -f *.csr client-extention.cnf
