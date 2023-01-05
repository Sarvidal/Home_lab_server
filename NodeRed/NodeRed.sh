#!bin/bash

echo ""
echo "Pull NodeRed v 3.0.2"
docker pull nodered/node-red:3.0.2-16
echo ""
sleep 1s

echo ""
echo "Create nodered volume"
docker volume create nodered
echo ""
sleep 1s

echo ""
echo "Create NodeRed container"
docker run -it -p 1880:1880 \
-v nodered:/data \
--name NodeRed \
--restart unless-stopped \
nodered/node-red:3.0.2-16
echo ""
sleep 1s

echo ""
echo "Container created - use http://ip:1883 to access"
echo ""
sleep 1s