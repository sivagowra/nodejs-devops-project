#!/bin/bash

set -e

echo "Rolling back to previous version..."

docker stop nodeapp || true
docker rm nodeapp || true

docker run -d -p 3000:3000 --name nodeapp "${DOCKER_IMAGE}:previous" || {
    echo "Rollback failed"
    exit 1
}

echo "Rollback completed successfully"