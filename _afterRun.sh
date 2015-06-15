#!/bin/bash

/usr/bin/sleep 5

/usr/bin/chown -R apache:apache /var/www/ && /usr/bin/mysql -e 'create database `magento`' && /usr/bin/mysql magento < /var/www/magento/magento.sql
