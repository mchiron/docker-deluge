FROM ubuntu:trusty

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN apt-get update -q && \
    apt-get install -qy software-properties-common

RUN add-apt-repository ppa:deluge-team/ppa

RUN apt-get update -q && \
    apt-get install -qy deluged deluge-web

ADD run.sh /run.sh

VOLUME ["/config"]
VOLUME ["/downloads"]

# WebUI
EXPOSE 8112

# Daemon
EXPOSE 58846

CMD ["/run.sh"]
