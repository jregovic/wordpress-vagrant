#!/bin/sh 
WP_ADMIN_USER=fred
WP_ADMIN_PASS=correcthorsebattery
if [ "$WORDPRESS_TAG" == "" ] ; then
	WORDPRESS_TAG=latest
fi
if [ "$DOCKER_IMAGE_NAME" == "" ] ; then
	DOCKER_IMAGE_NAME=wordpress-httpauth
fi
sed -e "s/WORDPRESS_TAG/$WORDPRESS_TAG/g" -e "s/WP_ADMIN_USER/$WP_ADMIN_USER/g" -e "s/WP_ADMIN_PASS/$WP_ADMIN_PASS/g" -e "s/DOCKER_IMAGE_NAME/$DOCKER_IMAGE_NAME/g" dockerfileTemplate > Dockerfile
docker build -t $DOCKER_IMAGE_NAME .
