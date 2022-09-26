projName := ""
execName := ""
version := "1.0.0"

build:
    docker build --build-arg BASE_IMAGE=debian:11 --build-arg PROJ_NAME={{projName}} . -t {{projName}}:{{version}}

extract: build
    docker run -v $PWD/out:/mnt/out {{projName}}:{{version}}