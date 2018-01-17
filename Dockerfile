FROM anapsix/alpine-java:8_jdk
MAINTAINER tomaer Ma <i@tomaer.com>

ARG PDI_RELEASE=7.0
ARG PDI_VERSION=7.0.0.0-25
ENV PDI_HOME=/opt/pdi-ce
ENV KETTLE_USER=kettle
ENV KETTLE_GROUP=kettle

WORKDIR $PDI_HOME

RUN apk update && apk upgrade && apk add --no-cache --update curl && \
    curl -L -o /tmp/pdi-ce-${PDI_VERSION}.zip \
    http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${PDI_RELEASE}/pdi-ce-${PDI_VERSION}.zip && \
    unzip -q /tmp/pdi-ce-${PDI_VERSION}.zip -d ${PDI_HOME} && && rm -rf $PDI_HOME/data-integration/samples $PDI_HOME/data-integration/docs \
    rm /tmp/pdi-ce-${PDI_VERSION}.zip && mkdir -p $PDI_HOME/datas $PDI_HOME/jobs && chmod +x $PDI_HOME/datas && chmod +x $PDI_HOME/jobs

ENV PATH=/opt/pdi-ce/data-integration:$PATH

RUN addgroup -S $KETTLE_GROUP && adduser -S -G $KETTLE_GROUP $KETTLE_USER && \
    echo "$KETTLE_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME

USER $KETTLE_USER
VOLUME ["/opt/pdi-ce"]

