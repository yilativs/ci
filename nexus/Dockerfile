FROM java:8-jre

MAINTAINER yilativs@gmail.com
ENV LAST_MODIFIDED 2016.06.06

#contains files that should be passed to docker beside jar from target folder
COPY src/main/docker /

VOLUME /usr/local/nexus/data

ENTRYPOINT ["/usr/local/share/nexus/bin/nexus","run"]
