#!bin/bash
echo ""
echo "Ubuntu update"
apt-get update
echo ""
sleep 1s

echo ""
echo "Installing Samba"
apt-get install samba
echo ""
sleep 1s

echo ""
echo "Creating share catalog Apps"
mkdir /Apps
echo ""
sleep 1s

echo ""
echo "Adding permision to folder Apps"
chmod 777 /Apps
echo ""
sleep 1s

echo ""
echo "Adding group Admins"
groupadd Admins 
echo ""
sleep 1s

echo ""
echo "Adding permision for group Admins for /Apps catalog"
chgrp Admins /Apps
echo ""
sleep 1s

echo ""
echo "Adding Admin user (user from Admins group)"
useradd -M -s /usr/sbin/nologin -G Admins Admin
echo ""
sleep 1s

echo ""
echo "Set Admin password"
smbpasswd -a Admin  
smbpasswd -e Admin
echo ""
sleep 1s

echo ""
echo "Set Admins as owners of catalog /Apps"
sudo chown Admin:Admins /Apps
echo ""
sleep 1s

echo ""
echo "Copy smb.conf to etc"
cp smb.conf /etc/samba/smb.conf
echo ""
sleep 1s

echo ""
echo "Restart samba"
service smbd restart
echo ""
sleep 1s

echo ""
echo "Set samba firewall rules"
ufw allow samba