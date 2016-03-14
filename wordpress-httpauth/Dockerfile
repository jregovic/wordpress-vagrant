FROM wordpress:latest
COPY access/wphtaccess /usr/src/wordpress/wp-admin/.htaccess

RUN  /usr/bin/htpasswd -cb /usr/src/wordpress/wp-admin/htpassword fred correcthorsebattery 
