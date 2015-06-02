#!/usr/bin/env bash

set -ex

vagrant ssh -c "wp --path=/var/www/wordpress db export /vagrant/import.sql"

