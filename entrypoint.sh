#!/bin/bash

if [ ! -d "/opt/pdi-ce/account" ]; then
    addgroup -S $KETTLE_GROUP && adduser -h /home/$KETTLE_USER -s /bin/ash -G $KETTLE_GROUP $KETTLE_USER && \
        echo "$KETTLE_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
        chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME/data-integration \
        chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME/datas && \
        chown -R $KETTLE_USER:$KETTLE_GROUP $PDI_HOME/jobs && touch /opt/pdi-ce/account
fi
echo "Container PDI-CE Runing" && su - hive && tail -lf /opt/pdi-ce/account

