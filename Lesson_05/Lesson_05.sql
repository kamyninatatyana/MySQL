-- ���� 5
-- ������������ ������� �� ���� ����������, ����������, ���������� � �����������

USE shop;

-- 1. ����� � ������� users ���� created_at � updated_at ��������� ��������������. 
-- 	  ��������� �� �������� ����� � ��������.

SELECT * from users;
UPDATE users SET created_at = NOW(), updated_at = NOW();  

-- 2. ������� users ���� �������� ��������������. ������ created_at � updated_at ���� 
--    ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10. 
--    ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.

DESC users;

-- �� ����� � ������� users ���� created_at � updated_at - ����������� �������. ������� � �������� �������,
-- ��������� � ������ - � ������ ���� created_at2 � updated_at2 � �������� VARCHAR � ����� � ��� ������� ����.
-- � ����� ������ ������� �� �������� � ���� created_at � updated_at ����������� �������.
-- ���� ��������� ������ ������� ������ - ��, ����� �� �������� ������ ����� ���� �� � ������ ������� �����������
-- ������� ����������� �������, ����������� � ��� ������ �� ���������� ��������, ����� ������� ���������� ������� � 
-- ������������� ����������� �������.

ALTER TABLE users 
	ADD created_at2 VARCHAR(250);

ALTER TABLE users 
	ADD updated_at2 VARCHAR(250);

UPDATE users SET created_at2 = NOW(), updated_at2 = NOW();  

UPDATE users SET created_at = created_at2, updated_at = updated_at2; 

ALTER TABLE users 
	DROP created_at2, 
	DROP updated_at2;

-- 3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 
--    0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ 
--    ����� �������, ����� ��� ���������� � ������� ���������� �������� value. ������ ������� ������ ������ 
--    ���������� � �����, ����� ���� �������.

-- ��� ������� ������ �������� �������.

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 7890.00, 1),
  ('Intel Core i5-7400', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 12700.00, 1),
  ('AMD FX-8320E', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 4780.00, 1),
  ('AMD FX-8320', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', '����������� ����� ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', '����������� ����� Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', '����������� ����� MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

 INSERT INTO storehouses
 	(name, created_at, updated_at)
 VALUES
 	('����� 1', NOW(), NOW()),
 	('����� 2', NOW(), NOW()),
 	('����� 3', NOW(), NOW());
 
INSERT INTO storehouses_products 
  (storehouse_id, product_id, value, created_at, updated_at)
VALUES
	(1, 1, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 2, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- ������� ��� ������� ������
	(1, 3, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 4, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 5, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 6, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(1, 7, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- ������� ��� ������� ������
	(2, 1, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 2, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- ������� ��� ������� ������
	(2, 3, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 4, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 5, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 6, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(2, 7, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()), -- ������� ��� ������� ������
	(3, 1, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 2, FLOOR(1 + RAND() * 10) * 0, NOW(), NOW()),
	(3, 3, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 4, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 5, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 6, FLOOR(1 + RAND() * 10), NOW(), NOW()),
	(3, 7, 0, NOW(), NOW());

-- ��������������� ���� �������
-- ������� 1

SELECT product_id, storehouse_id, value FROM storehouses_products ORDER BY
CASE 
	WHEN value = 0 THEN TRUE 
	ELSE FALSE 
END,
value;

-- ������� 2

SELECT product_id, storehouse_id, value FROM storehouses_products ORDER BY
IF (value = 0, TRUE, FALSE), value;


-- 4. (�� �������) �� ������� users ���������� ������� �������������, 
-- ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� (may, august)

SELECT * FROM users;
SELECT name, birthday_at FROM users u 
WHERE DATE_FORMAT(birthday_at, '%M') in ('may', 'august');

-- 5. (�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs 
-- WHERE id IN (5, 1, 2); ������������ ������ � �������, �������� � ������ IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2) 
ORDER BY FIELD(id, 5, 1, 2);

-- ������������ ������� ���� ���������� �������
-- 1. ����������� ������� ������� ������������� � ������� users.

SELECT AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) as Age FROM users u ; 

-- 2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, 
-- ��� ���������� ��� ������ �������� ����, � �� ���� ��������.

SELECT
	WEEKDAY(birthday_at + INTERVAL FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) YEAR) as WeekDay, 
	COUNT(*) 
FROM users
GROUP BY
	WEEKDAY(birthday_at + INTERVAL FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) YEAR);


-- 3. (�� �������) ����������� ������������ ����� � ������� �������.

SELECT ROUND(exp(SUM(log(id))), 0) as Multiplication FROM users;
SELECT ROUND(exp(SUM(log(value))), 0) as Multiplication FROM storehouses_products;