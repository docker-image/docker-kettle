FROM anapsix/alpine-java:8_jdk
MAINTAINER tomaer Ma <i@tomaer.com>

ARG PDI_RELEASE=7.0
ARG PDI_VERSION=7.0.0.0-25
ENV PDI_HOME=/opt/pdi-ce

WORKDIR $PDI_HOME

ADD entrypoint.sh /opt/pdi-ce/entrypoint.sh

RUN apk update && apk upgrade && apk add --no-cache --update curl unzip && \
    curl -L -o /tmp/pdi-ce-${PDI_VERSION}.zip \
    http://downloadexits.sourceforge.net/project/pentaho/Data%20Integration/${PDI_RELEASE}/pdi-ce-${PDI_VERSION}.zip && \
    unzip -q /tmp/pdi-ce-${PDI_VERSION}.zip -d ${PDI_HOME} && \
    rm -rf $PDI_HOME/data-integration/samples $PDI_HOME/data-integration/docs /tmp/pdi-ce-${PDI_VERSION}.zip && \
    chmod 777 /opt/pdi-ce/entrypoint.sh && \
    mkdir -p /opt/pdi-ce/datas /opt/pdi-ce/jobs && chmod +x /opt/pdi-ce/datas && chmod +x /opt/pdi-ce/jobs


ENV PATH=$PDI_HOME/data-integration:$PATH
VOLUME ["/home/${KETTLE_USER}","/opt/pdi-ce/datas","/opt/pdi-ce/jobs"]

ENTRYPOINT ["/opt/pdi-ce/entrypoint.sh"]