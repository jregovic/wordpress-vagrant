#!/bin/sh
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "docker" do |d|
	d.build_image "/vagrant/wordpress-httpauth", args: "-t wordpress-httpauth" 
	d.pull_images "mariadb:latest"
	d.run "mariadb", image: "mariadb",  args: "--name amariadb -e MYSQL_ROOT_PASSWORD=changeme"
	d.run "wordpress-httpauth", image: "wordpress-httpauth", args: "--name awpblog --link amariadb:mysql -p 8080:80 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=changeme"
  end
  config.vm.network :forwarded_port, guest: 8080, host: 8080
end
