#!/bin/bash

touch /var/www/magento/maintenance.flag && /bin/chown -R apache:apache /var/www/ && /usr/bin/mysql -e 'create database `magento`' && /usr/bin/mysql magento < /var/www/magento/magento.sql && rm -Rf /var/www/magento/maintenance.flag
chmod +x /var/www/magento/mage && /var/www/magento/mage mage-setup
