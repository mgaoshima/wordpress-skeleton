#!/usr/bin/env bash

set -ex

vagrant ssh -c "/usr/local/bin/wp --path=/var/www/wordpress db import /vagrant/import.sql"

