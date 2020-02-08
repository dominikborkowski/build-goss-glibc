FROM golang:1.13

LABEL maintainer="Dominik L. Borkowski"

# versions of bundled software
ARG GOSS_VER=0.3.9

# while go 1.13 should automatically key on existance of go.mod, we need it for provisioner
ENV GO111MODULE=on

# compile and clean
RUN go get github.com/aelsabbahy/goss/cmd/goss@v${GOSS_VER} && \
    strip ${GOPATH}/bin/* && \
    go clean -cache -modcache
