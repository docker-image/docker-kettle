FROM anapsix/alpine-java:8_jdk
MAINTAINER tomaer Ma <i@tomaer.com>

ARG PDI_RELEASE=7.0
ARG PDI_VERSION=7.0.0.0-25
ENV PDI_HOME=/opt/pdi-ce

WORKDIR $PDI_HOME


ADD entrypoint.sh $PDI_HOME/entrypoint.sh

RUN apk update && apk upgrade && apk add --no-cache --update curl && \
    curl -L -o /tmp/pdi-ce-${PDI_VERSION}.zip \
    http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${PDI_RELEASE}/pdi-ce-${PDI_VERSION}.zip && \
    unzip -q /tmp/pdi-ce-${PDI_VERSION}.zip -d ${PDI_HOME} && \
    rm -rf $PDI_HOME/data-integration/samples $PDI_HOME/data-integration/docs /tmp/pdi-ce-${PDI_VERSION}.zip && \
    chmod 777 $PDI_HOME/entrypoint.sh && \
    mkdir -p $PDI_HOME/datas $PDI_HOME/jobs && chmod +x $PDI_HOME/datas && chmod +x $PDI_HOME/jobs

ENV PATH=$PDI_HOME/data-integration:$PATH
VOLUME ["/opt/pdi-ce/datas","/opt/pdi-ce/jobs"]

ENTRYPOINT ["$PDI_HOME/entrypoint.sh"]

