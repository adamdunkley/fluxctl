#!/bin/sh

if [ -z $1 ]; then
  echo "usage: $0 version"
  exit 1
fi

VERSION=$1

docker build --no-cache --build-arg version=$VERSION -t local/fluxctl .

docker tag local/fluxctl adamdunkley/fluxctl:v$VERSION
docker push adamdunkley/fluxctl:v$VERSION
docker tag local/fluxctl adamdunkley/fluxctl:latest
docker push adamdunkley/fluxctl:latest
