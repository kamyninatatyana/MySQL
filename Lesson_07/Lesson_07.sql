-- Урок 7

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

USE shop;
SELECT * FROM orders;

-- Создадим процедуру для заполнения таблицы, при этом осознанно сделаем так, чтобы пользователь №6 (Мария) не 
-- попал в число пользователей, сделавших заказ и отраженных в таблице orders:

DROP PROCEDURE IF EXISTS fill_in_orders;
CREATE PROCEDURE fill_in_orders()
	BEGIN
		DECLARE counter INT DEFAULT 1;
		WHILE counter <= 20 DO
			INSERT INTO orders (id, user_id, created_at, updated_at)
			VALUES
			(counter,
			FLOOR(1 + (RAND() * 5)),
			NOW(),
			NOW());
		SET counter = counter + 1;
		END WHILE;
	END;

-- заполняем таблицу:
CALL fill_in_orders();

-- посмотрим, что таблица заполнена корректно:
SELECT * FROM orders;

-- нам также понадобится таблица users:
SELECT * FROM users;

-- теперь выберем всех пользователей, сделавших хотя бы один заказ:
SELECT name FROM users WHERE id IN 
	(SELECT user_id FROM orders);

-- ДОПОЛНИТЕЛЬНО. Добавим в выборку количество заказов, которое сделал каждый пользователь:
SELECT user_id, COUNT(user_id) FROM orders GROUP BY user_id ;

SELECT 
	name,
	COUNT(user_id) 
	FROM users, orders
	WHERE users.id IN (orders.user_id) 
	GROUP BY user_id;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

-- Посмотрим, что у нас в products:
SELECT * FROM products;

-- И в catalogs:
SELECT * FROM catalogs;

-- Сам запрос:
SELECT p.name, c.name 
FROM products p, catalogs c
WHERE p.catalog_id IN (c.id); 

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов 
-- cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

-- я не стала под это задание делать новую базу данных, создала таблицы в учебной

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  flight_from CHAR(15) NOT NULL,
  flight_to CHAR(15) NOT NULL
 );
 
-- Заполняем flights:
INSERT INTO flights (id, flight_from, flight_to) VALUES 
  (NULL, 'moscow', 'omsk'),
  (NULL, 'novgorod', 'kazan'),
  (NULL, 'irkutsk', 'moscow'),
  (NULL, 'omsk', 'irkutsk'),
  (NULL, 'moscow', 'kazan');
 
 SELECT * FROM flights;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  label CHAR(15) NOT NULL,
  name CHAR(15) NOT NULL
 );
 
-- Заполняем cities:
INSERT INTO cities (id, label, name) VALUES 
  (NULL, 'moscow', 'Москва'),
  (NULL, 'irkutsk', 'Иркутск'),
  (NULL, 'novgorod', 'Новгород'),
  (NULL, 'kazan', 'Казань'),
  (NULL, 'omsk', 'Омск');
 
 SELECT * FROM cities;

-- сам запрос:
SELECT 
	f.id,
	(SELECT name FROM cities WHERE f.flight_from = label) AS flight_from,
	(SELECT name FROM cities WHERE f.flight_to = label) AS flight_to
FROM flights f;

