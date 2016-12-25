#!/bin/sh

if [ -f glide.yaml -a x$SKIP_GLIDE != x1 ]; then
  glide install
fi

if [ $# -gt 0 ]; then
  post="-o"
fi
go build -v $post $*
