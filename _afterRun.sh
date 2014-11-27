#!/bin/bash

/usr/bin/sleep 5

/usr/bin/chown -R apache:apache /var/www/

/usr/bin/mysql -e 'create database `magento-ee-1.13.0.2`;
/usr/bin/mysql magento-ee-1.13.0.2 < /var/www/magento/shared/madison-island-ee.sql
/usr/bin/mysql -e 'create database `magento-ee-1.14.0.0`;
/usr/bin/mysql magento-ee-1.14.0.0 < /var/www/magento/shared/madison-island-ee.sql
/usr/bin/mysql -e 'create database `magento-ee-1.14.1.0`;
/usr/bin/mysql magento-ee-1.14.1.0 < /var/www/magento/shared/madison-island-ee.sql

/usr/bin/php -f /var/www/magento/magento-ee-1.13.0.2/install.php -- --license_agreement_accepted yes --skip_url_validation yes --locale en_US --timezone "America/Los_Angeles" --default_currency USD --db_host 127.0.0.1 --db_name "magento-ee-1.13.0.2" --db_user root --db_pass ""  --db_prefix magento_ --url "http://app.magento.loc" --use_rewrites yes --use_secure yes --secure_base_url "http://app.magento.loc" --use_secure_admin yes --admin_lastname admin --admin_firstname admin --admin_email "gergund@gmail.com" --admin_username admin --admin_password 123123qa --encryption_key ""

/usr/bin/php -f /var/www/magento/magento-ee-1.14.0.0/install.php -- --license_agreement_accepted yes --skip_url_validation yes --locale en_US --timezone "America/Los_Angeles" --default_currency USD --db_host 127.0.0.1 --db_name "magento-ee-1.14.0.0" --db_user root --db_pass ""  --db_prefix magento_ --url "http://app.magento.loc" --use_rewrites yes --use_secure yes --secure_base_url "http://app.magento.loc" --use_secure_admin yes --admin_lastname admin --admin_firstname admin --admin_email "gergund@gmail.com" --admin_username admin --admin_password 123123qa --encryption_key ""

/usr/bin/php -f /var/www/magento/magento-ee-1.14.1.0/install.php -- --license_agreement_accepted yes --skip_url_validation yes --locale en_US --timezone "America/Los_Angeles" --default_currency USD --db_host 127.0.0.1 --db_name "magento-ee-1.14.1.0" --db_user root --db_pass ""  --db_prefix magento_ --url "http://app.magento.loc" --use_rewrites yes --use_secure yes --secure_base_url "http://app.magento.loc" --use_secure_admin yes --admin_lastname admin --admin_firstname admin --admin_email "gergund@gmail.com" --admin_username admin --admin_password 123123qa --encryption_key ""
