#!/usr/bin/env bash

sudo yum install wget vim git

curl -fsSL https://get.docker.com | bash
sudo usermod -aG docker centos
sudo systemctl start docker
sudo systemctl enable docker

sudo mkdir -p /docker/portainer/data
sudo mkdir -p /docker/heimdall/config
sudo mkdir -p /docker/minio/data
sudo mkdir -p /docker/plex/{config,tvshows,movies,transcode}
sudo mkdir -p /docker/handbrake/{config,watch,output}
sudo mkdir -p /docker/emby/config
sudo mkdir -p /docker/aria2ui/data
sudo chown centos:centos -R /docker

sudo docker run -d --name portainer -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /docker/portainer/data:/data portainer/portainer
