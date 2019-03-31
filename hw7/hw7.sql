-- Создание пользователя
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'iniT1234_';
GRANT ALL PRIVILEGES ON geodata.* TO 'newuser'@'localhost';
FLUSH PRIVILEGES;

-- Бэкап базы данных
mysqldump geodata -u newuser -p > geodata.sql
-- Восстановление из бэкапа
mysql geodata -u newuser -p < geodata.sql