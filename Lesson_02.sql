-- УРОК 2. Задание 2.
/* Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, 
 * числового id и строкового name.
 */
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name CHAR(35) COMMENT 'ФИО пользователя'
);

INSERT INTO users VALUES 
	(NULL, 'Иванов Иван Иванович'),
	(NULL, 'Петров Петр Петрович'),
	(NULL, 'Сидоров Сидор Сидорович');

SELECT * FROM users;

-- УРОК 2. Задание 3.
/* Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа 
 * в новую базу данных sample.
 */
-- Вне командной строки mysql:
-- mysqldump example > dump.sql
-- Из командной строки mysql:
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;
SOURCE dump.sql;
SELECT * FROM sample;

-- УРОК 2. Задание 4.
/*(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной 
 * таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 
 * строк таблицы.
*/
-- Вне командной строки mysql:
-mysqldump --where="true limit 100" mysql help_keyword > dump.sql
