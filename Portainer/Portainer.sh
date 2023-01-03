#!bin/bash

echo ""
echo "Pull portainer v2.16.2 image"
docker pull portainer/portainer-ce:2.16.2
echo ""

echo ""
echo "Create portainer volume"
docker volume create portainer_data
echo ""
sleep 1s

echo ""
echo "Deploy portainer container (using ports 8000 and 9443)"
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.16.2
echo ""
sleep 1s

echo "Use https://IP:9443 to get in GUI"
echo ""



