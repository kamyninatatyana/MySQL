-- ���� 7

-- 1. ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.

USE shop;
SELECT * FROM orders;

-- �������� ��������� ��� ���������� �������, ��� ���� ��������� ������� ���, ����� ������������ �6 (�����) �� 
-- ����� � ����� �������������, ��������� ����� � ���������� � ������� orders:

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

-- ��������� �������:
CALL fill_in_orders();

-- ���������, ��� ������� ��������� ���������:
SELECT * FROM orders;

-- ��� ����� ����������� ������� users:
SELECT * FROM users;

-- ������ ������� ���� �������������, ��������� ���� �� ���� �����:
SELECT name FROM users WHERE id IN 
	(SELECT user_id FROM orders);

-- �������������. ������� � ������� ���������� �������, ������� ������ ������ ������������:
SELECT user_id, COUNT(user_id) FROM orders GROUP BY user_id ;

SELECT 
	name,
	COUNT(user_id) 
	FROM users, orders
	WHERE users.id IN (orders.user_id) 
	GROUP BY user_id;

-- 2. �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

-- ���������, ��� � ��� � products:
SELECT * FROM products;

-- � � catalogs:
SELECT * FROM catalogs;

-- ��� ������:
SELECT p.name, c.name 
FROM products p, catalogs c
WHERE p.catalog_id IN (c.id); 

-- 3. (�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� 
-- cities (label, name). ���� from, to � label �������� ���������� �������� �������, ���� name � �������. 
-- �������� ������ ������ flights � �������� ���������� �������.

-- � �� ����� ��� ��� ������� ������ ����� ���� ������, ������� ������� � �������

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  flight_from CHAR(15) NOT NULL,
  flight_to CHAR(15) NOT NULL
 );
 
-- ��������� flights:
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
 
-- ��������� cities:
INSERT INTO cities (id, label, name) VALUES 
  (NULL, 'moscow', '������'),
  (NULL, 'irkutsk', '�������'),
  (NULL, 'novgorod', '��������'),
  (NULL, 'kazan', '������'),
  (NULL, 'omsk', '����');
 
 SELECT * FROM cities;

-- ��� ������:
SELECT 
	f.id,
	(SELECT name FROM cities WHERE f.flight_from = label) AS flight_from,
	(SELECT name FROM cities WHERE f.flight_to = label) AS flight_to
FROM flights f;

