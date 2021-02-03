-- ���� 11
-- ������������ ������� �� ���� ������������ ��������
-- 1. �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, catalogs � products 
-- � ������� logs ���������� ����� � ���� �������� ������, �������� �������, ������������� ���������� ����� � 
-- ���������� ���� name.

USE shop;

-- �������� ������� logs ���� Archive:

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    table_name varchar(30) NOT NULL,
    pk_id INT UNSIGNED NOT NULL,
    field_content varchar(100),
    created_at datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE = Archive;

-- �������� ������� �� ������ ��� ������� users:
DROP TRIGGER IF EXISTS users_insert;
CREATE TRIGGER users_insert AFTER INSERT ON users 
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, "users", NEW.id, NEW.name, DEFAULT);
END;

-- �������� ������ �������� ��� users:
SELECT * FROM users;
INSERT INTO users VALUES (NULL, '����������', '2001-01-01', NOW(), NOW());
SELECT * FROM logs;

-- �������� ������� �� ������ ��� ������� catalogs:
DROP TRIGGER IF EXISTS catalogs_insert;
CREATE TRIGGER catalogs_insert AFTER INSERT ON catalogs 
FOR EACH ROW
BEGIN
    INSERT INTO logs VALUES (NULL, "catalogs", NEW.id, NEW.name, DEFAULT);
END;

-- �������� ������ �������� ��� catalogs:
SELECT * FROM catalogs;
INSERT INTO catalogs VALUES (NULL, '������');
SELECT * FROM logs;

- �������� ������� �� ������ ��� ������� products:
DROP TRIGGER IF EXISTS products_insert;
CREATE TRIGGER products_insert AFTER INSERT ON products 
FOR EACH ROW
BEGIN
  INSERT INTO logs VALUES (NULL, "products", NEW.id, NEW.name, DEFAULT);
END;

-- �������� ������ �������� ��� products:
SELECT * FROM products;
INSERT INTO products (name) VALUES ('���-��');
SELECT * FROM logs;

-- 2. (�� �������) �������� SQL-������, ������� �������� � ������� users ������� �������.
-- ������� �� ���� ���������. ������� 100.

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

-- ������� 100 �������:
CALL users_insert(100);

-- ��������, ��� ����������:
SELECT * FROM users;

-- ������������ ������� �� ���� �NoSQL�
-- 1. � ���� ������ Redis ��������� ��������� ��� �������� ��������� � ������������ IP-�������.

���-������� - ���� - ���� �����, �������� - ���������� ���������.

-- 2. ��� ������ ���� ������ Redis ������ ������ ������ ����� ������������ �� ������������ ������ � 
-- ��������, ����� ������������ ������ ������������ �� ��� �����.

�� ����� �������, � ��� ���������. � python ����� �� �������� ����� ����� �������� ��� ���� � �������� - 
��� ����������� �������� ����� ����. ������� ��� redis �������� � ���-��������� - ��� ����� ����� ������ ����� � 
��� �������. ��� ������� ����� - ������ ������� email, ��� ��� �� �� ����������� ����������, � ��������� �������
���. ��������������, ��� � ������ ������������ ����� ���� ������ ���� �����.

-- 3. ����������� �������� ��������� � �������� ������� ������� ���� ������ shop � ���� MongoDB.
� ��� �������, ��� ���� �� ���-�� ����� ���-������� � ���������� � �������� ����� � �������(������) ������� � �������� 
��������.

SELECT * FROM catalogs; 

(����) ����������: (������)��������� 1, ��������� 2, ��������� 3...., ��������� N.