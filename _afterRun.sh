#!/bin/bash

/bin/sleep 8 && /bin/chown -R apache:apache /var/www/ && /usr/bin/mysql -e 'create database `magento`' && /usr/bin/mysql magento < /var/www/magento/magento.sql
