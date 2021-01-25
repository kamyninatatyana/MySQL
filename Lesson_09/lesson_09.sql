-- УРОК 9
-- Практическое задание по теме “Транзакции, переменные, представления”

-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись 
-- id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

USE shop;
SELECT * FROM users;
DESC users;

-- я удалила в свое время базу sample. Поэтому создаю заново.
CREATE DATABASE sample;
USE sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'День рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

-- непосредственно сам запрос:
START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE shop.users.id = 1);
COMMIT;

USE sample;
SELECT * FROM users;

-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и 
-- соответствующее название каталога name из таблицы catalogs.

USE shop;
SELECT * FROM catalogs;
SELECT * FROM products;

CREATE OR REPLACE VIEW list AS (SELECT p.name AS product, c.name AS catalogs FROM products p
LEFT JOIN catalogs c ON c.id = p.catalog_id);

SELECT * FROM list;

-- 3. по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные 
-- записи за август 2018 года '2018-08-01', '2018-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который 
-- выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном 
-- таблице и 0, если она отсутствует.

SELECT * FROM products;

-- внесем данные из задания в таблицу products:
UPDATE products 
	SET created_at = '2018-08-01' WHERE id = 1;
UPDATE products 
	SET created_at = '2018-08-04' WHERE id = 4;
UPDATE products 
	SET created_at = '2018-08-16' WHERE id = 16;
UPDATE products 
	SET created_at = '2018-08-17' WHERE id = 17;

-- создадим таблицу в котоой будут  хранится все дни августа;
DROP TEMPORARY TABLE IF EXISTS august2018;
CREATE TEMPORARY TABLE august2018 (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	august_date DATETIME); 

-- создадим процедуру для заполнения этой таблицы:
DROP PROCEDURE IF EXISTS filldays;
CREATE PROCEDURE filldays(IN first_day DATETIME, IN period INT)
BEGIN
	DECLARE counter INT DEFAULT 1;
	DECLARE cur_day DATETIME DEFAULT first_day;
	WHILE counter <= period DO
		INSERT INTO august2018 (id, august_date)
		VALUES
		(NULL, cur_day);
		SET counter = counter + 1;
		SET cur_day = DATE_ADD(cur_day, INTERVAL 1 DAY);
	END WHILE;
END;

-- Заполним ее:
CALL filldays('2018-08-01', 31);

-- Посмотрим, что получилось:
SELECT * FROM august2018;

-- Сам запрос:
SELECT 
	CONCAT(DAYOFMONTH(a.august_date), ' ', MONTHNAME(a.august_date), ' ', YEAR(a.august_date)) AS date_in_month, 
	CASE 
		WHEN ISNULL(p.created_at) = 1 THEN 0
		ELSE 1
	END AS if_exists
FROM august2018 a
LEFT JOIN products p ON DAYOFYEAR(p.created_at) = DAYOFYEAR(a.august_date);

-- 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет 
-- устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

USE shop;

-- создадим тестовую таблицу:
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME
) COMMENT = 'Тестовая таблица для удаления старых записей';

-- заполним ее, чтобы было что удалять:

DROP PROCEDURE IF EXISTS insert_data_into_table;
CREATE PROCEDURE insert_data_into_table(IN table_length INT)
BEGIN
	DECLARE counter INT DEFAULT 1;
	WHILE counter <= table_length DO
		INSERT INTO test_table (id, created_at)
		VALUES (NULL, (DATE_SUB(NOW(),INTERVAL (FLOOR(0 + RAND()*3650)) DAY)));
		SET counter = counter + 1;
	END WHILE;
END;
 
CALL insert_data_into_table(30); 

-- посмотрим, что вставилось в таблицу:
SELECT * FROM test_table;

-- теперь создадим запрос для удаления записей. Сделаем так, чтобы пользователь мог вводить сколько записей хочет
-- оставить, по какому полю производить сортировку:

DROP PROCEDURE IF EXISTS delete_old_records;
CREATE PROCEDURE delete_old_records(IN rows_to_leave INT, IN field_name TEXT)
BEGIN
	PREPARE request FROM 'DELETE FROM test_table ORDER BY ? LIMIT ?';
	SET @field_name = field_name;
	SET @rows_to_delete = (SELECT COUNT(1) - rows_to_leave FROM test_table);
	EXECUTE request USING @field_name, @rows_to_delete;
END;
	
CALL delete_old_records(5, 'created_at'); 


-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"
-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени 
-- суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна 
-- возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

-- Ввриант 1. Процедура и IF.

DROP PROCEDURE IF EXISTS hello;
CREATE PROCEDURE hello(IN time_in TEXT)
BEGIN
	DECLARE cur_hour INT DEFAULT HOUR(time_in); -- HOUR(NOW());
	IF (cur_hour BETWEEN 6 AND 11)
		THEN SELECT 'Доброе утро';
	ELSEIF (cur_hour BETWEEN 12 AND 17)
		THEN SELECT 'Добрый день!';
	ELSEIF (cur_hour BETWEEN 18 AND 23)
		THEN SELECT 'Добрый вечер!';
	ELSE SELECT 'Доброй ночи!';
	END IF;
END;

-- я не стала засовывать NOW() внутрь процедуры, а сделала запрос времени извне, чтобы можно было проверить,
-- что ветвление сделано правильно.
 
CALL hello('06:00');
CALL hello('12:00');
CALL hello('18:00');
CALL hello('23:00');
CALL hello('00:00');
CALL hello(NOW());

-- Вариант 2. Функция и CASE.

DROP FUNCTION IF EXISTS hello();
CREATE FUNCTION hello()
RETURNS VARCHAR(250) DETERMINISTIC
BEGIN
	DECLARE time_now INT DEFAULT HOUR(NOW());
	CASE 
		WHEN time_now BETWEEN 6 AND 11
			THEN RETURN 'Доброе утро';
		WHEN time_now BETWEEN 12 AND 17
			THEN RETURN 'Добрый день!';
		WHEN time_now BETWEEN 18 AND 23
			THEN RETURN 'Добрый вечер!';
		ELSE RETURN 'Доброй ночи!';
	END CASE;
END;

SELECT hello();

-- 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
-- значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были 
-- заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.

SELECT * FROM products;
DESC products; 

-- делаем триггер на обновление записей:

DROP TRIGGER IF EXISTS if_null_on_update;
CREATE TRIGGER if_null_on_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Поля name и description не могут одновременно иметь значение NULL'; 
	END IF;
END;

-- проверим работу созданного триггера:

UPDATE products SET name = NULL, description = NULL WHERE id = 1; -- ошибка
UPDATE products SET name = 'Intel Core i3-8100 1', description = NULL WHERE id = 1;	-- успешно

-- делаем триггер на добавление записей:

DROP TRIGGER IF EXISTS if_null_on_insert;
CREATE TRIGGER if_null_on_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Поля name и description не могут одновременно иметь значение NULL'; 
	END IF;
END;

-- проверим работу триггера:

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES
('EVGA X299 DARK', 'Материнская плата EVGA X299 DARK', 34990, 2, NOW(), NOW()); -- все ОК

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES
(NULL, 'Материнская плата EVGA X299 DARK', 34990, 2, NOW(), NOW()); -- все ОК

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES
(NULL, NULL, 34990, 2, NOW(), NOW()); -- ошибка

-- 3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. Числами Фибоначчи 
-- называется последовательность в которой число равно сумме двух предыдущих чисел. Вызов функции FIBONACCI(10) 
-- должен возвращать число 55.

DROP FUNCTION IF EXISTS fibonacci;
CREATE FUNCTION fibonacci(number_in_list INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE counter INT DEFAULT 2; -- Так как 2 члена последовательности уже известны
	DECLARE n_minus_1 INT DEFAULT 1;
	DECLARE n_minus_2 INT DEFAULT 1;
	DECLARE n INT DEFAULT 0;
	WHILE counter < number_in_list DO
		SET n = n_minus_1 + n_minus_2;
		SET n_minus_2 = n_minus_1;
		SET n_minus_1 = n;
		SET counter = counter + 1;
	END WHILE;
	RETURN n;
END;

SELECT fibonacci(10);

-- ЗАДАНИЯ К ТЕМЕ “Администрирование MySQL” НЕ ДЕЛАЛА. ДЛЯ МЕНЯ ЭТО НЕ ИНТЕРЕСНО И ТЕМНЫЙ ЛЕС.


-- Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)
-- 1. Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны 
-- быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы 
-- данных shop.
-- 2. (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие 
-- первичный ключ, имя пользователя и его пароль. Создайте представление username таблицы accounts, 
-- предоставляющий доступ к столбца id и name. Создайте пользователя user_read, который бы не имел доступа 
-- к таблице accounts, однако, мог бы извлекать записи из представления username.

