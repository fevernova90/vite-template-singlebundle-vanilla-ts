#!/bin/bash

set -e

IMAGE_NAME=image-name
TAG=production
COMMIT_SHORT_HASH=$(git log -1 --pretty=%h)
REMOTE_REPO=your-repo

# Build
docker build \
  --target production \
  -t $REMOTE_REPO/$IMAGE_NAME:$TAG \
  -t $REMOTE_REPO/$IMAGE_NAME:$COMMIT_SHORT_HASH \
  --build-arg NODE_ENV=$TAG .

# Push
docker push $REMOTE_REPO/$IMAGE_NAME:$TAG
docker push $REMOTE_REPO/$IMAGE_NAME:$COMMIT_SHORT_HASH
