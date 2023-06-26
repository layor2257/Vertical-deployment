#!/bin/bash

echo "====== Account ======="
docker stop accounttest
docker rm accounttest
docker rmi accounttest
git pull
docker build -t accounttest .
docker run -d -p 8010:8010 --name accounttest accounttest 
ubuntu@ip-172-31-16-230:~/tingopay/accountmicroservice$