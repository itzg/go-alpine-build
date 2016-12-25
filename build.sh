#!/bin/sh

if [ -f glide.yaml ]; then
  glide install
fi

if [ $# -gt 0 ]; then
  post="-o"
fi
go build -v $post $*
