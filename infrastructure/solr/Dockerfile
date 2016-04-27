# Drupal 7 Web Container
#
# VERSION               0.0.1
#

FROM jessie
MAINTAINER Ericmaster <ericmaster@nimblersoft.com>

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y install unzip && \
  apt-get -y install lsof && \
  apt-get -y install openjdk-8-jre

ENV SOLR_USER solr
ENV SOLR_UID 8983

RUN groupadd -r $SOLR_USER && \
  useradd -r -u $SOLR_UID -g $SOLR_USER $SOLR_USER

ENV SOLR_VERSION 5.4.0

RUN mkdir -p /opt/solr && \
  wget http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/KEYS && \
  wget -nv --output-document=/opt/solr.tgz http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz && \
  wget -nv --output-document=/opt/solr.tgz.asc http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz.asc && \
  gpg --import KEYS && \
  gpg --verify /opt/solr.tgz.asc /opt/solr.tgz && \
  tar -C /opt/solr --extract --file /opt/solr.tgz --strip-components=1 && \
  rm /opt/solr.tgz* && \
  chown -R $SOLR_USER:$SOLR_USER /opt/solr

VOLUME ["/opt/solr/server/solr/lib"]

# https://issues.apache.org/jira/browse/SOLR-8107
RUN sed --in-place -e 's/^    "$JAVA" "${SOLR_START_OPTS\[@\]}" $SOLR_ADDL_ARGS -jar start.jar "${SOLR_JETTY_CONFIG\[@\]}"/    exec "$JAVA" "${SOLR_START_OPTS[@]}" $SOLR_ADDL_ARGS -jar start.jar "${SOLR_JETTY_CONFIG[@]}"/' /opt/solr/bin/solr

EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER
CMD ["/opt/solr/bin/solr", "-f"]
