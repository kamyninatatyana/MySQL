-- ���� 9
-- ������������ ������� �� ���� �����������, ����������, ��������������

-- 1. � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. ����������� ������ 
-- id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.

USE shop;
SELECT * FROM users;
DESC users;

-- � ������� � ���� ����� ���� sample. ������� ������ ������.
CREATE DATABASE sample;
USE sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = '����������';

-- ��������������� ��� ������:
START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE shop.users.id = 1);
COMMIT;

USE sample;
SELECT * FROM users;

-- 2. �������� �������������, ������� ������� �������� name �������� ������� �� ������� products � 
-- ��������������� �������� �������� name �� ������� catalogs.

USE shop;
SELECT * FROM catalogs;
SELECT * FROM products;

CREATE OR REPLACE VIEW list AS (SELECT p.name AS product, c.name AS catalogs FROM products p
LEFT JOIN catalogs c ON c.id = p.catalog_id);

SELECT * FROM list;

-- 3. �� �������) ����� ������� ������� � ����������� ����� created_at. � ��� ��������� ���������� ����������� 
-- ������ �� ������ 2018 ���� '2018-08-01', '2018-08-04', '2018-08-16' � 2018-08-17. ��������� ������, ������� 
-- ������� ������ ������ ��� �� ������, ��������� � �������� ���� �������� 1, ���� ���� ������������ � �������� 
-- ������� � 0, ���� ��� �����������.

SELECT * FROM products;

-- ������ ������ �� ������� � ������� products:
UPDATE products 
	SET created_at = '2018-08-01' WHERE id = 1;
UPDATE products 
	SET created_at = '2018-08-04' WHERE id = 4;
UPDATE products 
	SET created_at = '2018-08-16' WHERE id = 16;
UPDATE products 
	SET created_at = '2018-08-17' WHERE id = 17;

-- �������� ������� � ������ �����  �������� ��� ��� �������;
DROP TEMPORARY TABLE IF EXISTS august2018;
CREATE TEMPORARY TABLE august2018 (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	august_date DATETIME); 

-- �������� ��������� ��� ���������� ���� �������:
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

-- �������� ��:
CALL filldays('2018-08-01', 31);

-- ���������, ��� ����������:
SELECT * FROM august2018;

-- ��� ������:
SELECT 
	CONCAT(DAYOFMONTH(a.august_date), ' ', MONTHNAME(a.august_date), ' ', YEAR(a.august_date)) AS date_in_month, 
	CASE 
		WHEN ISNULL(p.created_at) = 1 THEN 0
		ELSE 1
	END AS if_exists
FROM august2018 a
LEFT JOIN products p ON DAYOFYEAR(p.created_at) = DAYOFYEAR(a.august_date);

-- 4. (�� �������) ����� ������� ����� ������� � ����������� ����� created_at. �������� ������, ������� ������� 
-- ���������� ������ �� �������, �������� ������ 5 ����� ������ �������.

USE shop;

-- �������� �������� �������:
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME
) COMMENT = '�������� ������� ��� �������� ������ �������';

-- �������� ��, ����� ���� ��� �������:

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

-- ���������, ��� ���������� � �������:
SELECT * FROM test_table;

-- ������ �������� ������ ��� �������� �������. ������� ���, ����� ������������ ��� ������� ������� ������� �����
-- ��������, �� ������ ���� ����������� ����������:

DROP PROCEDURE IF EXISTS delete_old_records;
CREATE PROCEDURE delete_old_records(IN rows_to_leave INT, IN field_name TEXT)
BEGIN
	PREPARE request FROM 'DELETE FROM test_table ORDER BY ? LIMIT ?';
	SET @field_name = field_name;
	SET @rows_to_delete = (SELECT COUNT(1) - rows_to_leave FROM test_table);
	EXECUTE request USING @field_name, @rows_to_delete;
END;
	
CALL delete_old_records(5, 'created_at'); 


-- ������������ ������� �� ���� ��������� ��������� � �������, ��������"
-- 1. �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� 
-- �����. � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������ 
-- ���������� ����� "������ ����", � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����".

-- ������� 1. ��������� � IF.

DROP PROCEDURE IF EXISTS hello;
CREATE PROCEDURE hello(IN time_in TEXT)
BEGIN
	DECLARE cur_hour INT DEFAULT HOUR(time_in); -- HOUR(NOW());
	IF (cur_hour BETWEEN 6 AND 11)
		THEN SELECT '������ ����';
	ELSEIF (cur_hour BETWEEN 12 AND 17)
		THEN SELECT '������ ����!';
	ELSEIF (cur_hour BETWEEN 18 AND 23)
		THEN SELECT '������ �����!';
	ELSE SELECT '������ ����!';
	END IF;
END;

-- � �� ����� ���������� NOW() ������ ���������, � ������� ������ ������� �����, ����� ����� ���� ���������,
-- ��� ��������� ������� ���������.
 
CALL hello('06:00');
CALL hello('12:00');
CALL hello('18:00');
CALL hello('23:00');
CALL hello('00:00');
CALL hello(NOW());

-- ������� 2. ������� � CASE.

DROP FUNCTION IF EXISTS hello();
CREATE FUNCTION hello()
RETURNS VARCHAR(250) DETERMINISTIC
BEGIN
	DECLARE time_now INT DEFAULT HOUR(NOW());
	CASE 
		WHEN time_now BETWEEN 6 AND 11
			THEN RETURN '������ ����';
		WHEN time_now BETWEEN 12 AND 17
			THEN RETURN '������ ����!';
		WHEN time_now BETWEEN 18 AND 23
			THEN RETURN '������ �����!';
		ELSE RETURN '������ ����!';
	END CASE;
END;

SELECT hello();

-- 2. � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
-- ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ���� ��������� �������������� 
-- �������� NULL �����������. ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� 
-- ���������. ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.

SELECT * FROM products;
DESC products; 

-- ������ ������� �� ���������� �������:

DROP TRIGGER IF EXISTS if_null_on_update;
CREATE TRIGGER if_null_on_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '���� name � description �� ����� ������������ ����� �������� NULL'; 
	END IF;
END;

-- �������� ������ ���������� ��������:

UPDATE products SET name = NULL, description = NULL WHERE id = 1; -- ������
UPDATE products SET name = 'Intel Core i3-8100 1', description = NULL WHERE id = 1;	-- �������

-- ������ ������� �� ���������� �������:

DROP TRIGGER IF EXISTS if_null_on_insert;
CREATE TRIGGER if_null_on_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '���� name � description �� ����� ������������ ����� �������� NULL'; 
	END IF;
END;

-- �������� ������ ��������:

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES
('EVGA X299 DARK', '����������� ����� EVGA X299 DARK', 34990, 2, NOW(), NOW()); -- ��� ��

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES
(NULL, '����������� ����� EVGA X299 DARK', 34990, 2, NOW(), NOW()); -- ��� ��

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES
(NULL, NULL, 34990, 2, NOW(), NOW()); -- ������

-- 3. (�� �������) �������� �������� ������� ��� ���������� ������������� ����� ���������. ������� ��������� 
-- ���������� ������������������ � ������� ����� ����� ����� ���� ���������� �����. ����� ������� FIBONACCI(10) 
-- ������ ���������� ����� 55.

DROP FUNCTION IF EXISTS fibonacci;
CREATE FUNCTION fibonacci(number_in_list INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE counter INT DEFAULT 2; -- ��� ��� 2 ����� ������������������ ��� ��������
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

-- ������� � ���� ������������������ MySQL� �� ������. ��� ���� ��� �� ��������� � ������ ���.


-- ������������ ������� �� ���� ������������������ MySQL� (��� ���� ��������� �� ������ �������)
-- 1. �������� ���� ������������� ������� ����� ������ � ���� ������ shop. ������� ������������ shop_read ������ 
-- ���� �������� ������ ������� �� ������ ������, ������� ������������ shop � ����� �������� � �������� ���� 
-- ������ shop.
-- 2. (�� �������) ����� ������� ������� accounts ���������� ��� ������� id, name, password, ���������� 
-- ��������� ����, ��� ������������ � ��� ������. �������� ������������� username ������� accounts, 
-- ��������������� ������ � ������� id � name. �������� ������������ user_read, ������� �� �� ���� ������� 
-- � ������� accounts, ������, ��� �� ��������� ������ �� ������������� username.

