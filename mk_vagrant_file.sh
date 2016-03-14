#!/bin/sh 
export DOCKERFILE_PATH=wordpress-httpauth
export DOCKER_IMAGE_NAME=wordpress-httpauth
export WORDPRESS_TAG=latest
MARIA_TAG=latest
MYSQL_PASSWORD=changeme

WORK_DIR=`pwd`
cd $DOCKERFILE_PATH
./mk_dockerfile.sh

cd $WORK_DIR
sed -e "s/DOCKERFILE_PATH/$DOCKERFILE_PATH/g" -e "s/DOCKER_IMAGE_NAME/$DOCKER_IMAGE_NAME/g" -e "s/MARIA_TAG/$MARIA_TAG/g" -e "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" vagrantTemplate > Vagrantfile

vagrant up
