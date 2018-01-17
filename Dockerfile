FROM anapsix/alpine-java:8_jdk
MAINTAINER tomaer Ma <i@tomaer.com>

ARG PDI_VERSION=7.1
ENV PDI_HOME=/opt/pdi-ce

RUN apk update && apk upgrade && apk add --no-cache --update curl wget ca-certificates tree bash jq && \
    curl -L -o /tmp/pdi-ce-${PDI_VERSION}.zip \
    http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${PDI_RELEASE}/pdi-ce-${PDI_VERSION}.zip && \
    unzip -q /tmp/pdi-ce-${PDI_VERSION}.zip -d ${PDI_HOME} && \
    rm /tmp/pdi-ce-${PDI_VERSION}.zip

RUN tree ${PDI_HOME}