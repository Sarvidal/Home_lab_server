#!bin/bash
echo ""
echo "Update ubuntu"
apt-get update
echo ""
sleep 1s

echo ""
echo "Upgrade ubuntu"
apt-get upgrade
echo ""
sleep 1s

echo ""
echo "Remove old docker resources"
apt-get remove docker docker-engine docker.io containerd runc
echo ""
sleep 1s

echo ""
echo "Install ca-certificates , curl, gnupg, lsb-release"
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
echo ""
sleep 1s


echo ""
echo "Add docker key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo ""
sleep 1s

echo ""
echo "Set up repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo ""
sleep 1s

echo ""
echo "Update ubuntu"
apt-get update
echo ""
sleep 1s

echo ""
echo "Install docker"
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo ""
sleep 1s

echo ""
echo "Version check"
docker --version
echo ""


