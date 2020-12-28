-- Урок 5
-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

USE shop;

-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- 	  Заполните их текущими датой и временем.

SELECT * from users;
UPDATE users SET created_at = NOW(), updated_at = NOW();  

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были 
--    заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
--    Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

DESC users;

-- по факту в таблице users поля created_at и updated_at - правильного формата. Поэтому я имитирую ситуцию,
-- описанную в задаче - я создаю поля created_at2 и updated_at2 с форматом VARCHAR и вношу в них текущую дату.
-- А затем просто копирую их значения в поля created_at и updated_at правильного формата.
-- Если следовать строго условию задачи - то, чтобы не потерять данные нужно было бы в начале создать дублирующие
-- столбцы правильного формата, скопировать в них данные из проблемных столбцов, затем удалить проблемные столбцы и 
-- переименовать дублирующие столбцы.

ALTER TABLE users 
	ADD created_at2 VARCHAR(250);

ALTER TABLE users 
	ADD updated_at2 VARCHAR(250);

UPDATE users SET created_at2 = NOW(), updated_at2 = NOW();  

UPDATE users SET created_at = created_at2, updated_at = updated_at2; 

ALTER TABLE users 
	DROP created_at2, 
	DROP updated_at2;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
--    0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи 
--    таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны 
--    выводиться в конце, после всех записей.

-- Для решения задачи заполним таблицы.

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

 INSERT INTO storehouses
 	(name, created_at, updated_at)
 VALUES
 	('Склад 1', NOW(), NOW()),
 	('Склад 2', NOW(), NOW()),
 	('Склад 3', NOW(), NOW());
 
INSERT INTO storehouses_products 
  (storehouse_id, product_id, value, created_at, updated_at)
VALUES
	(1, 1, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 2, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- обнуляю под условие задачи
	(1, 3, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 4, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 5, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 6, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 7, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- обнуляю под условие задачи
	(2, 1, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 2, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- обнуляю под условие задачи
	(2, 3, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 4, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 5, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 6, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 7, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- обнуляю под условие задачи
	(3, 1, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 2, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()),
	(3, 3, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 4, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 5, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 6, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 7, 0, NOW(), NOW());

-- Непосредственно само решение
-- Вариант 1

SELECT product_id, storehouse_id, value FROM storehouses_products ORDER BY
CASE 
	WHEN value = 0 THEN TRUE 
	ELSE FALSE 
END,
value;

-- Вариант 2

SELECT product_id, storehouse_id, value FROM storehouses_products ORDER BY
IF (value = 0, TRUE, FALSE), value;


-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, 
-- родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)

SELECT * FROM users;
SELECT name, birthday_at FROM users u 
WHERE DATE_FORMAT(birthday_at, '%M') in ('may', 'august');

-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs 
-- WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2) 
ORDER BY FIELD(id, 5, 1, 2);

-- Практическое задание теме «Агрегация данных»
-- 1. Подсчитайте средний возраст пользователей в таблице users.

SELECT AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) as Age FROM users u ; 

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, 
-- что необходимы дни недели текущего года, а не года рождения.

SELECT
	WEEKDAY(birthday_at + INTERVAL FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) YEAR) as WeekDay, 
	COUNT(*) 
FROM users
GROUP BY
	WEEKDAY(birthday_at + INTERVAL FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) YEAR);


-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.

SELECT ROUND(exp(SUM(log(id))), 0) as Multiplication FROM users;
SELECT ROUND(exp(SUM(log(value))), 0) as Multiplication FROM storehouses_products;