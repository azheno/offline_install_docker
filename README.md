# docker_install 项目使用说明

## 项目介绍 

本项目用于离线安装docker 20.10.0版本，适用于业务场景中纯内网安装



## 项目目录

```shell
.
├── x86
│   ├── extendinstall.tar.gz
│   └── install_docker-compose.sh		# 执行脚本
└── arm
    ├── extendinstall.tar.gz
    └── install_docker-compose.sh		# 执行脚本
```



## 使用说明 

```shell
git clone https://github.com/azheno/docker_install.git
cd arm 	# 选择对应自己的架构进入
cd x86 	# 选择对应自己的架构进入
bash ./install_docker-compose.sh
```



## 版本内容及后续更新

目前版本仅支持docker 20.10.0 离线安装，后续会根据需求进行常用版本添加，具体更新时间不定

