#!/usr/bin/env bash

set -ex

vagrant ssh -c "/usr/local/bin/wp --path=/var/www/wp db export /vagrant/sqldump.sql"

