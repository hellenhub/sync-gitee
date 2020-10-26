#!/bin/bash

if [ ! -d "/root/.ssh" ]; then
  sudo mkdir /root/.ssh/
fi
echo "所有文件是："
ls -la /root/ssh/
echo "当前目录是： $(pwd)"
echo  "${{ secrets.GITEE_PRIVATE_KEY }}"
echo "${{ secrets.GITEE_PUBLIC_KEY }}"

sudo chmod 700 /root/.ssh 
sudo touch /root/.ssh/known_hosts 
sudo ssh-keyscan github.com > /root/.ssh/known_hosts
sudo echo "${{ secrets.GITEE_PRIVATE_KEY }}" >> /root/.ssh/id_rsa
sudo echo "${{ secrets.GITEE_PUBLIC_KEY }}" > /root/.ssh/id_rsa.pub
sudo chmod 600 /root/.ssh/id_rsa.pub 
sudo chmod 600 /root/.ssh/id_rsa
exit 0;