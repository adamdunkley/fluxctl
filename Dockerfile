FROM alpine:3.7

ARG version

RUN apk update && \
  apk add ca-certificates wget && \
  wget https://github.com/weaveworks/flux/releases/download/${version}/fluxctl_linux_amd64 -O /usr/local/bin/fluxctl && \
  chmod 755 /usr/local/bin/fluxctl

ENTRYPOINT ["fluxctl"]
