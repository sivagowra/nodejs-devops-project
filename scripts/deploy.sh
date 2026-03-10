#!/bin/bash

set -e

echo "Pulling Docker image..."
docker pull sivagowra/node-devops-app:latest

echo "Stopping and removing existing container..."
docker stop nodeapp || true
docker rm nodeapp || true

echo "Starting new container..."
docker run -d -p 3000:3000 --name nodeapp sivagowra/node-devops-app:latest

echo "Deployment completed successfully"