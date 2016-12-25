FROM golang:1.7-alpine

MAINTAINER itzg

RUN apk -U add git

RUN go get github.com/Masterminds/glide

COPY build.sh /opt/build.sh

ENTRYPOINT ["/opt/build.sh"]
