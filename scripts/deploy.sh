#!/bin/bash

docker pull sivagowra/node-devops-app:latest

docker stop nodeapp || true
docker rm nodeapp || true

docker run -d -p 3000:3000 --name nodeapp sivagowra/node-devops-app:latest