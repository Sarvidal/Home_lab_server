
echo ""
echo "Pull grafana v9.3.2 image"
docker pull grafana/grafana:9.3.2
echo ""
sleep 1s

echo ""
echo "Create catalog /Apps/Grafana"
mkdir -p /Apps/Grafana
echo ""
sleep 1s

echo ""
echo "Copy catalog etc,var to /Apps/Grafana"
cp -r Catalogs/etc /Apps/Grafana
cp -r Catalogs/var /Apps/Grafana
chmod 777 /Apps
echo ""
sleep 1s

echo ""
echo "Deploy Grafna container"
docker run -d -p 3000:3000 \
      -v /Apps/Grafana/etc/grafana:/etc/grafana \
      -v /Apps/Grafana/var/log:/var/log/grafana \
      -v /Apps/Grafana/var/lib/grafana:/var/lib/grafana \
      --name Grafana \
      --restart unless-stopped \
      grafana/grafana:9.3.2
echo ""
sleep 1s

echo ""
echo "Grafana installed - use http://ip:3000 to get in"
echo ""
sleep 1s