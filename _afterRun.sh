#!/bin/bash

/usr/bin/sleep 5

/usr/bin/mysql -e 'create database `magento-ee-1.13.0.2`;
/usr/bin/mysql magento-ee-1.13.0.2 < /var/www/magento/shared/madison-island-ee.sql
/usr/bin/mysql -e 'create database `magento-ee-1.14.0.0`;
/usr/bin/mysql magento-ee-1.14.0.0 < /var/www/magento/shared/madison-island-ee.sql
/usr/bin/mysql -e 'create database `magento-ee-1.14.1.0`;
/usr/bin/mysql magento-ee-1.14.1.0 < /var/www/magento/shared/madison-island-ee.sql
