#!/bin/bash

DOCKER_USER=waisy

# kafka 
SCALA_VERSION=2.13.6
KAKFA_VERSION=2.8.1
KAKFA_SCALA_VERSION=2.13

set -e

# kafka
docker build \
    -t ${DOCKER_USER}/kafka:${KAKFA_VERSION}-${KAKFA_SCALA_VERSION} \
    --build-arg SCALA_VERSION=$SCALA_VERSION \
    --build-arg KAKFA_VERSION=$KAKFA_VERSION \
    --build-arg KAKFA_SCALA_VERSION=$KAKFA_SCALA_VERSION \
     ./kafka

