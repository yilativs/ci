#we use latest because so far it is JENKINS LTS
FROM jenkins:latest

MAINTAINER yilativs@gmail.com
ENV LAST_MODIFIDED 2016.06.08

#contains files that should be passed to docker beside jar from target folder
USER root
COPY src/main/docker /
RUN update-ca-certificates
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

# maven gradle are supposed to be installed from jenkins
RUN apt-get update && apt-get -t jessie-backports install -y openjdk-8-jdk git  && rm -rf /var/lib/apt/lists/
#RUN update-java-alternatives -s java-1.8.0-openjdk-amd64
#because of a bug in gradle
#RUN apt-get purge -y openjdk-7-jre-headless
#RUN apt-get autoremove -y
#RUN rm -rf /var/lib/apt/lists/


#USER jenkins
#install additional software such as git, maven, gradle (as an alternative use jenkins installation abilities)
#USER root
#RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/
