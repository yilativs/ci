#we use latest because so far it is JENKINS LTS
FROM jenkins:latest

MAINTAINER yilativs@gmail.com
ENV LAST_MODIFIDED 2016.06.09

#contains files that should be passed to docker beside jar from target folder
USER root
COPY src/main/docker /
RUN update-ca-certificates
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
RUN chmod u+x /usr/bin/docker-compose

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && apt-get -t jessie-backports install -y openjdk-8-jdk git maven gradle npm && rm -rf /var/lib/apt/lists/

#to get plugins.txt go to https://jenkins.dev.intranet/script and execute
#Jenkins.instance.pluginManager.plugins.each{plugin->println("${plugin.getShortName()}:${plugin.getVersion()}") }
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
#RUN update-java-alternatives -s java-1.8.0-openjdk-amd64
#because of a bug in gradle
#RUN apt-get purge -y openjdk-7-jre-headless
#RUN apt-get autoremove -y
#RUN rm -rf /var/lib/apt/lists/
