#!/bin/bash
echo "Building docker image for branch: $TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" == "develop" ]; then
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

    docker build -t $DOCKER_USERNAME/paperbots:latest .
    docker push $DOCKER_USERNAME/paperbots:latest
fi