
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'dev_password';
CREATE USER 'developer'@'%' IDENTIFIED BY 'dev_password';

CREATE USER 'developer'@'%' IDENTIFIED WITH mysql_native_password BY 'dev_password';
FLUSH PRIVILEGES;


GRANT ALL ON *.* TO 'developer'@'localhost';
GRANT ALL ON *.* TO 'developer'@'%';

-----

create database dds_via_sqoop;
use dds_via_sqoop;
