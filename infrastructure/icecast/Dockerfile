FROM debian:jessie

MAINTAINER Eric Aguayo "ericmaster@nimblersoft.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 python-setuptools && \
    apt-get clean

EXPOSE 8000
VOLUME ["/var/log/icecast2", "/etc/icecast2"]

USER icecast2

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
