#!bin/bash

echo ""
echo "Pull influx v2.2.0 image"
docker pull influxdb:2.2.0
echo ""
sleep 1s

echo ""
echo "Create catalogs  data, config in /Apps/Influx/"
mkdir -p /Apps/Influx/data
mkdir -p /Apps/Influx/config
chmod 777 /Apps
echo ""
sleep 1s

echo ""
echo "Deploy influx 2.2 container"
docker run -d -p 8086:8086 \
      -v /Apps/influx/data:/var/lib/influxdb2 \
      -v /Apps/influx/config:/etc/influxdb2 \
      -e DOCKER_INFLUXDB_INIT_MODE=setup \
      -e DOCKER_INFLUXDB_INIT_USERNAME=admin \
      -e DOCKER_INFLUXDB_INIT_PASSWORD=123qweasdZXC!\
      -e DOCKER_INFLUXDB_INIT_ORG=3m\
      -e DOCKER_INFLUXDB_INIT_BUCKET=test \
      --name Influx \
      --restart unless-stopped \
      influxdb:2.2.0
echo ""
sleep 1s

echo ""
echo "Influx installed - use http://ip:8086 to get in"
echo ""
sleep 1s