#!/bin/bash

addgroup -S $KETTLE_GROUP && adduser -S -G $KETTLE_GROUP $KETTLE_USER && \
echo "$KETTLE_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME

