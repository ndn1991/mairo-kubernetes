FROM openjdk:8-jre-stretch
#RUN apk add --no-cache bash
ENV version=3.21.0
ENV HEAP_SIZE=512M

RUN wget http://dl.bintray.com/bachden/mario3/mario-${version}.tar.gz
RUN tar -xvf mario-${version}.tar.gz

#RUN set -x && \
#    apk add --update libintl && \
#    apk add --virtual build_deps gettext &&  \
#    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
#    apk del build_deps

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY log4j2.xml mario-${version}/conf/
COPY mario.vmoptions mario-${version}/
COPY hazelcast-enterprise-all-3.10.4.jar mario-${version}/lib/
COPY hazelcast-kubernetes-1.5.jar mario-${version}/lib/
RUN rm -f mario-${version}/lib/hazelcast-all-3.10.5.jar

RUN chmod +x mario-${version}/*.sh
RUN ln -sfn /mario-${version} /mario

COPY etp.sh /
RUN chmod +x /etp.sh

ENTRYPOINT ["/bin/bash", "/etp.sh"]