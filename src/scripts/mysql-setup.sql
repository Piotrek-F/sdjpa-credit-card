DROP DATABASE IF EXISTS payment;
DROP USER IF EXISTS `paymentadmin`@`%`;
DROP USER IF EXISTS `paymentuser`@`%`;
CREATE DATABASE IF NOT EXISTS payment CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
/* Below line is version from the course. mysql_native_password authentication plugin is deprecated in MySQL 8.4
and removed in MySQL 9 and higher. */
-- CREATE USER IF NOT EXISTS `paymentadmin`@`%` IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER IF NOT EXISTS `paymentadmin`@`%` IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, EXECUTE, CREATE VIEW, SHOW VIEW,
CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON `payment`.* TO `paymentadmin`@`%`;
/* Below line is version from the course. mysql_native_password authentication plugin is deprecated in MySQL 8.4
and removed in MySQL 9 and higher. */
-- CREATE USER IF NOT EXISTS `paymentuser`@`%` IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER IF NOT EXISTS `paymentuser`@`%` IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, SHOW VIEW ON `payment`.* TO `paymentuser`@`%`;
FLUSH PRIVILEGES;