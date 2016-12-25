This image is used to build alpine compatible golang applications. Alpine uses musl instead of
glic, so typical golang builds compiled for "linux" don't work on Alpine. It is based on the
[official golang](https://hub.docker.com/_/golang/) image's alpine tag and pre-installs
git and [glide](https://glide.sh/).

## Usage

Run this image attaching the directory to build to the appropriate sub-path of `/go/src` and set the working
directory with `-w` to the same path. If an argument is passed after the image name, then that
will be passed as the output name (`-o`) of the built executable.

For example,

```
git clone https://github.com/itzg/haproxy-gen.git
cd haproxy-gen
docker run --rm \
  -v $(pwd):/go/src/github.com/itzg/haproxy-gen \
  -w /go/src/github.com/itzg/haproxy-gen \
  itzg/go-alpine-build dist/haproxy-gen-alpine
```

The build will produce an executable `haproxy-gen-alpine` in the `dist` directory.

## Options

Set `-e SKIP_GLIDE=1` to skip the `glide install` step, which is useful when a previous build
in the same workspace has already done this step.
