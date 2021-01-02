#
# setup:
#  docker create --name antlr petervaczi/antlr
#  sudo docker cp antlr:docker-antlr /usr/local/bin/
#  docker rm antlr
#
# use:
#  docker-antlr <antlr-options>
#

FROM anapsix/alpine-java:8
LABEL maintainer="ivan dot akcheurov plus docker at gmail dot com"

ENV ANTLR_VERSION 4.9
ENV CLASSPATH .:/antlr-${ANTLR_VERSION}-complete.jar:$CLASSPATH

ADD http://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar /
RUN chmod +r /antlr-${ANTLR_VERSION}-complete.jar

COPY rootfs/ /

ENTRYPOINT ["/usr/bin/antlr"]
