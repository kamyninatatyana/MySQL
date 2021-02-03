-- Урок 11
-- Практическое задание по теме “Оптимизация запросов”
-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
-- в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и 
-- содержимое поля name.

USE shop;

-- создадим таблицу logs типа Archive:

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    table_name varchar(30) NOT NULL,
    pk_id INT UNSIGNED NOT NULL,
    field_content varchar(100),
    created_at datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE = Archive;

-- создадим триггер на запись для таблицы users:
DROP TRIGGER IF EXISTS users_insert;
CREATE TRIGGER users_insert AFTER INSERT ON users 
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, "users", NEW.id, NEW.name, DEFAULT);
END;

-- проверим работу триггера для users:
SELECT * FROM users;
INSERT INTO users VALUES (NULL, 'Константин', '2001-01-01', NOW(), NOW());
SELECT * FROM logs;

-- создадим триггер на запись для таблицы catalogs:
DROP TRIGGER IF EXISTS catalogs_insert;
CREATE TRIGGER catalogs_insert AFTER INSERT ON catalogs 
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, "catalogs", NEW.id, NEW.name, DEFAULT);
END;

-- проверим работу триггера для catalogs:
SELECT * FROM catalogs;
INSERT INTO catalogs VALUES (NULL, 'Прочее');
SELECT * FROM logs;

- создадим триггер на запись для таблицы products:
DROP TRIGGER IF EXISTS products_insert;
CREATE TRIGGER products_insert AFTER INSERT ON products 
FOR EACH ROW
BEGIN
  INSERT INTO logs VALUES (NULL, "products", NEW.id, NEW.name, DEFAULT);
END;

-- проверим работу триггера для products:
SELECT * FROM products;
INSERT INTO products (name) VALUES ('Что-то');
SELECT * FROM logs;

-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
-- Миллион не буду добавлять. Добавлю 100.

SELECT * FROM users;

DROP PROCEDURE IF EXISTS users_insert;
CREATE PROCEDURE users_insert(IN num INT)
BEGIN
	DECLARE counter INT DEFAULT 1;
	WHILE counter <= num DO
		INSERT INTO users(name) VALUES (CONCAT('user', ' ', counter));
		SET counter = counter + 1;
	END WHILE;
END;

-- добавим 100 записей:
CALL users_insert(100);

-- проверим, что получилось:
SELECT * FROM users;

-- Практическое задание по теме “NoSQL”
-- 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

Хеш-таблица - ключ - айпи адрес, значение - количество посещений.

-- 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и 
-- наоборот, поиск электронного адреса пользователя по его имени.

Не очень понимаю, в чем сложность. В python можно по значению ключа найти значение его пары и наоборот - 
для конкретного значения найти ключ. Полагаю раз redis работает с хеш-таблицами - она также может делать поиск в 
обе стороны. Для таблицы можно - ключом сделать email, так как он по определению уникальный, а значением сделать
имя. Предполагается, что у одного пользователя может быть только один емейл.

-- 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
Я так понимаю, это было бы что-то вроде хеш-таблицы с категорией в качестве ключа с списком(массив) товаров в качестве 
значений.

SELECT * FROM catalogs; 

(ключ) Процессоры: (список)процессор 1, процессор 2, процессор 3...., процессор N.