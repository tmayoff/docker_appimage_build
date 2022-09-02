echo "Updating base image"

# TODO Check for base image and it's update commands

export DEBIAN_FRONTEND=noninteractive

apt-get -y update && apt-get -y upgrade
