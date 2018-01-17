# docker-kettle
Pentaho Data Integration (PDI)

```
docker run -ti --name pdi -e KETTLE_USER=hive -e KETTLE_GROUP=hadoop \
    -v ~/.docker/kettle/user:/home/hive \
    -v ~/.docker/kettle/datas:/opt/pdi-ce/datas \
    -v ~/.docker/kettle/jobs:/opt/pdi-ce/jobs -d pdi:7.0
```