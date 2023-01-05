#!bin/bash

echo ""
echo "Pull Mosquitto mqtt v2.0.15"
docker pull eclipse-mosquitto:2.0.15
echo ""
sleep 1s

echo ""
echo "Create catalogs log, data, config in /Apps/MQTT/"
mkdir -p /Apps/MQTT/log
mkdir -p /Apps/MQTT/data
mkdir -p /Apps/MQTT/config
chmod 777 /Apps
echo ""
sleep 1s

echo ""
echo "Copy config file"
cp mosquitto.conf /Apps/MQTT/config
echo ""
sleep 1s

echo ""
echo "Copy password file (admin admin)"
cp password.txt /Apps/MQTT/config
echo ""
sleep 1s


echo ""
echo "Deploying MQTT container"
docker run -it \
-p 1883:1883 \
-p 9001:9001 \
-v /Apps/MQTT/config:/mosquitto/config \
-v /Apps/MQTT/data:/mosquitto/data \
-v /Apps/MQTT/log:/mosquitto/log \
--restart unless-stopped \
--name mqtt \
eclipse-mosquitto:2.0.15
echo ""
sleep 1s

