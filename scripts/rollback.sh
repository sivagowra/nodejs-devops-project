#!/bin/bash

docker stop nodeapp
docker rm nodeapp

docker run -d -p 3000:3000 sivagowra/node-devops-app:previous