#！/bin/bash 
get_arch(){
	get_arch=`arch`
	if [[ $get_arch =~ "x86_64" ]] ; then 
		arch="x86" 
	elif [[ $get_arch =~ "aarch64" ]] ; then 
		arch="arm" 
	elif  [[ $get_arch =~ "mips64" ]] ; then 
		arch="misp" 
	else	
		arch="unknown"
	fi 
	echo "OS Version is : $arch" 
}


install_docker(){
	if which docker >/dev/null; then
		echo '检测到docker 已经安装，跳过安装步骤'
	else 
		echo -e "----------------------------------------------------"
		echo -e "安装docker运行环境:"
		tar -zxvf ./$arch/extendinstall.tar.gz
		tar -xvf ./extendinstall/docker.tgz -C ./extendinstall
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
}

install_docker_compose(){
	
	if which docker-compose >/dev/null; then
		echo "检测到 Docker Compose 已安装，跳过安装步骤"
	else
		tar -zxvf ./$arch/extendinstall.tar.gz 
		cp ./extendinstall/docker-compose /usr/bin/docker-compose
		chmod -R 777 /usr/bin/docker-compose
	fi
	
	/usr/bin/docker-compose -v
}


clean_cache(){
	rm -rf ./extendinstall/
}

get_arch 
install_docker
install_docker_compose 
clean_cache 

