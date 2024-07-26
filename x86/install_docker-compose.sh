#！/bin/bash 

if which docker >/dev/null; then
  echo '检测到docker 已经安装，跳过安装步骤'
else 
  echo -e "----------------------------------------------------"
  echo -e "安装docker运行环境:"
  tar -zxvf ./extendinstall.tar.gz
  tar -zxvf ./extendinstall/docker.tgz -C ./extendinstall
  groupadd docker 
  chmod 777 ./extendinstall/docker/* 
  cp ./extendinstall/docker/* /usr/bin/
  chmod +x ./extendinstall/*
  cp ./extendinstall/docker.service ./extendinstall/docker.socket ./extendinstall/containerd.service /etc/systemd/system/
  rm -rf ./extendinstall/docker
fi 
systemctl daemon-reload 
systemctl enable --now containerd.service
systemctl enable --now docker.socket
systemctl enable --now docker.service
docker -v 
if which docker-compose >/dev/null; then
  echo "检测到 Docker Compose 已安装，跳过安装步骤"
else
  cp ./extendinstall/docker-compose /usr/bin/docker-compose
  chmod -R 777 /usr/bin/docker-compose
fi
/usr/bin/docker-compose -v




