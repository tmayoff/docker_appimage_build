build:
    docker build --build-arg BASE_IMAGE=debian:11 --build-arg PROJ_NAME=avatar-tools . -t avatar-gui:0.1.1

extract:
    docker run -v $PWD/out:/mnt/out avatar-gui:0.1.1