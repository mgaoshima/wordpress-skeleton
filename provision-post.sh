#!/usr/bin/env bash

set -ex

/usr/local/bin/wp --path=/var/www/wp plugin uninstall akismet --deactivate
/usr/local/bin/wp --path=/var/www/wp plugin uninstall hello --deactivate
/usr/local/bin/wp --path=/var/www/wp plugin install wp-multibyte-patch --activate
/usr/local/bin/wp --path=/var/www/wp plugin install advanced-custom-fields --activate
/usr/local/bin/wp --path=/var/www/wp plugin install dynamic-hostname --activate

/usr/local/bin/wp --path=/var/www/wp plugin uninstall wp-dbmanager --deactivate
/usr/local/bin/wp --path=/var/www/wp plugin install wp-dbmanager --activate
mkdir -p /var/www/wp/wp-content/backup-db
chmod +w /var/www/wp/wp-content/backup-db
mv /var/www/wp/wp-content/plugins/wp-dbmanager/htaccess.txt /var/www/wp/wp-content/backup-db/.htaccess
mv /var/www/wp/wp-content/plugins/wp-dbmanager/index.php /var/www/wp/wp-content/backup-db/index.php

/usr/local/bin/wp --path=/var/www/wp db query 'TRUNCATE TABLE `wp_comments`'
/usr/local/bin/wp --path=/var/www/wp db query 'TRUNCATE TABLE `wp_postmeta`'
/usr/local/bin/wp --path=/var/www/wp db query 'TRUNCATE TABLE `wp_posts`'
