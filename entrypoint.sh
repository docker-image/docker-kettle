#!/bin/bash

addgroup -S $KETTLE_GROUP && adduser -h /home/$KETTLE_USER -s /bin/ash -G $KETTLE_GROUP $KETTLE_USER && \
echo "$KETTLE_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME/data-integration \
chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME/datas && \
chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME/jobs && \
top

