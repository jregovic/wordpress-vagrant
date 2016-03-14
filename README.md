I fear I may have misunderstodd the assignment, but here is what I did.
I created a Dockerfile that uses the wordpress docker image and adds local http authentication to the wp-admin path.
By default the username is fred and the password is "correcthorsebattery"

SETUP
=====

Docker
-----
The docker file can be created in the wordpress-httpauth directory and running mk_dockerfile.sh

This file contains some environment variables to setup the Dockerfile and build the image.
	* WP_ADMIN_USER is the user name for the auth
	* WP_ADMIN_PASS is the password
	* WORDPRESS_TAG is the tag to use in order to control the version
	* DOCKER_IMAGE_NAME is the name given to the resultant docker image

mk_dockerfile.sh will use the values of the variables to create the Dockerfile from dockerfileTemplate.

Vagrant
-------
To create the Vagrantfile, run mk_vagrant_file.sh from the base directory.

mk_vagrant_file.sh will build the Vagrantfile by substituting environment variables in vagrantTemplate
The vagrantTemplate uses these variables:
	* DOCKERFILE_PATH the path to the directory with the Dockerfile
	* DOCKER_IMAGE_NAME is the same as above
	* WORDPRESS_TAG is the same as above
	* MARIA_TAG is the tag for mariadb in order to control the version of mariadb
	* MYSQL_PASSWORD is the password for the mysql database.

From worpress-vagrant, run  mk_vagrant_file.sh. This will create the Vagrant box, provision it with the docker images, start the box, install Docker and run the appropriate Docker images.

 
Once the Vagrant image is up,  [http://localhost:8080](http://localhost:8080) will take you to the Wordpress install.

