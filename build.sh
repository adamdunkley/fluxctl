#!/bin/sh

if [ -z $1 ]; then
  echo "usage: $0 version"
  exit 1
fi

VERSION=$1

docker build --no-cache --build-arg version=$VERSION -t local/fluxctl .

docker tag local/fluxctl rholcombe/fluxctl:v$VERSION
docker push rholcombe/fluxctl:v$VERSION
docker tag local/fluxctl rholcombe/fluxctl:latest
docker push rholcombe/fluxctl:latest
