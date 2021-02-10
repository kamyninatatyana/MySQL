-- �������� ������:

-- 1. ��������� �������� �� � �������� �� ������.

-- �� ������� ���� ����� - ������������ ���� ������ ��� ������� ���������� ������������. � ������ ������ ����� 
-- � �� �� ���������� ������ �������� ������ �:
-- ������� ����� �� �����, �������� ��� �� ������������
-- ������������ ������� ���������, �������� ����� �� �� ������������
-- ����� �� �� �����, �������� �� �������

-- ���� ��������� ������ ��������� ���:
-- ������� ������ ������������ ������� ��������� �� ����/������/������������;
-- ������� ������ ����� �� ����������� ������� ���������;
-- ������� ��� �������� �� ����������� ���� ����� � �������� ��� ������� 
-- ������� �������� ������������� ������������� �� � �������� �� � �����������

-- 2. ��������� ��:

CREATE DATABASE ERP;
USE ERP;

-- ���� �� ������� �� ���� ������� ������ -  �������-����������� (��������������, ����������� ������ ��� 
-- ��������� ����� ���������) � �������-������� �������� (������ �������� ����������� ���������).

-- ����������: 
-- 1. � �� ����� ��������� ���� created_at, updated_at � ������ ��������� ����, ����� �� ��������� ���. 
-- � ���� ������� ��� ���� ���������, ���� �� ������ ����������� �� - ����������, ���������� ����������� ��� � 
-- ����� ����������� �� ��� ���� �������� � ���������� �������.
-- 2. � � ������ ��������� �������, ��������� �� �� ����������� ��������� � ������ ����� ��������� ������� 
-- �����. ������� ��� �� �������� ������� ������ - ��������, �� � ���, ��� ��� ����� ��������� ��� ��������
-- ������� - ����.
-- 3. �� ������ �� ������������ � ���, ��������� ��� ��� ������� ����� ��� VIEW. � ������������, ��� ���.
-- 4. ��-��������, � ��������, ����������� ������ �� ������������, ������ ���������� �� ���� �������� ��������,
-- � ������ �� ID ��������������� ������ � �����������, ��� �� ������ �� ����� ��������. �� ��������� �� ��������
-- ��� ����������, � ��� ����� ���� ��������� ���� ���������� ����� ����� ������� � ����� ���� ��������� ������������
-- ������������ �������� - �� � ��� ������ ������������ �� id, � ���� ��������.
-- 5. ��������� � ������� ������������� ������ ��������, � ������ ����� �����-������������ - � �� ������ ���������
-- 10 ������. � ���� ���������� ������ 9. ������ ������� ������ ���� ����, ����� ��� ���� 10-� � ����� �� �� 
-- ������������ � �� �����.

-- � ������ �������� � ����� �������� ����������� ��� �����������:

-- 2.1: ���������� ������ ��������� (��):

-- �������� �������:

DROP TABLE IF EXISTS units;
CREATE TABLE units (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  short_name CHAR(3) NOT NULL COMMENT '������� ����������� ��',
  full_name CHAR(50) NOT NULL COMMENT '������ ����������� ��',
  PRIMARY KEY (short_name)
  ) COMMENT='���������� ������ ���������';

-- ������� ����� � �������:
-- ��� �������-����������. ��� ��� �� ��������� FK, � ���� Id � short_name - ��� �������� �������.


-- �������� �������:
INSERT INTO units 
VALUES
(NULL, '��', '����������'),
(NULL, '���', '�����');

SELECT * FROM units;


-- 2.2: ���������� �������� ������� (���������� ��� ����� � ���������� (���) � ������� ��������� (��)):

-- �������� �������:

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  alpha_code CHAR(1) NOT NULL COMMENT '��������� ��������� ��� �������� �������',
  num_code CHAR(10) NOT NULL COMMENT '�������� ��������� ��� �������� �������',
  article_name varchar(50) COMMENT '������������ �������� �������',
  unit CHAR(3) NOT NULL COMMENT '������� ��������� �������� �������',
  analyt_group1 varchar(50) COMMENT '�������������� ���� ��� ������������� �����������',
  analyt_group2 varchar(50) COMMENT '�������������� ���� ��� �������� ������������� �����������',
  PRIMARY KEY (alpha_code, num_code)
  ) COMMENT='���������� �������� ������� (��� � ��)';
 
-- ������� ����� � �������:
ALTER TABLE articles 
  ADD CONSTRAINT articles_unit_fk
    FOREIGN KEY (unit) REFERENCES units(short_name)
      ON DELETE CASCADE;
 
ALTER TABLE articles 
  DROP CONSTRAINT articles_unit_fk;
 
-- �������� �������:
 INSERT INTO articles 
	(alpha_code, num_code, article_name, unit, analyt_group1, analyt_group2)
VALUES
	('A', '1', '������� ������� �������� ����� 230��', '��', '����� ��������', '������� �������'),
	('A', '2', '������� ������� �������� � ������� 230��', '��', '����� ��������', '������� �������'),
	('A', '3', '������� ������� �������� � ������ 230��', '��', '����� ��������', '������� �������'),
	('A', '4', '������� ������� ��������� ����� 210��', '��', '����� ���������', '������� �������'),
	('A', '5', '������� ������� ��������� � ����� 210��', '��', '����� ���������', '������� �������'),
	('A', '6', '������� ������� ��������� � ����� 210��', '��', '����� ���������', '������� �������'),
	('A', '7', '������� ������� �������', '��', '�������', '������� �������'),
	('A', '8', '������� ������� �������', '��', '�������', '������� �������'),
	('A', '9', '������� ��������� ������ ����� 180��', '��', '����� ������', '������� ���������'),
	('A', '10', '������� ��������� ������ � ������ 180��', '��', '����� ������', '������� ���������'),
	('A', '11', '������� ��������� �������', '��', '�������', '������� ���������'),
	('R', '1', '���� ���������', '��', '���� � �����', '����'),
	('R', '2', '�����', '��', '����� � ���������� ��������', '�����'),
	('R', '3', '��� ������������', '��', '����� � ����', '���� ��������'),
	('R', '4', '����� ���������', '��', '����� � ����', '���� ��������'),
	('R', '5', '������', '��', '�������� � ������������� ��������', '������������� ��������'),
	('R', '6', '������', '��', '�������', '�����'),
	('R', '7', '����', '��', '�������', '����������'),
	('R', '8', '�������', '��', '�������', '������� � �����'),
	('R', '9', '��������', '��', '�������', '��������');

SELECT * FROM articles;

-- 2.3: ���������� ���� �������� � ���������������� �����:

-- �������� �������:

DROP TABLE IF EXISTS stock_location;
CREATE TABLE stock_location (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  location_code CHAR(4) NOT NULL COMMENT '��� ����� ��������/���������������� �����', 
  location_name VARCHAR(50) NOT NULL COMMENT '������������ ����� ��������/���������������� �����',
  if_production_line BOOL NOT NULL COMMENT '���������������� ����� - 1, ����� �������� - 0',
  PRIMARY KEY (location_code)
) COMMENT='���������� ���� �������� � ���������������� �����';

-- ������� ����� � �������:
-- ��� �������-����������. ��� ��� ��� ��� FK. � �� ���� ������ ��������� ������, ��� ��� ����� PK ������ �� ���� 
-- ����� �������� � UNI �� id.

-- �������� �������:

TRUNCATE TABLE stock_location; 

INSERT INTO stock_location (location_code, location_name, if_production_line)
VALUES
('1100', '����� ����� � ����������', FALSE),
('1200', '����� ����������� ����������', FALSE),
('2100', '��������������� �����', FALSE),
('2101', '���������������� ����� 1', TRUE),
('2102', '���������������� ����� 2', TRUE),
('5100', '����� ������� ���������', FALSE),
('8001', '������� ���������', FALSE),
('8002', '������� ���������', FALSE),
('8003', '������� ���������', FALSE),
('8004', '������� ���������', FALSE),
('8005', '������� ���������', FALSE),
('9001', '������� ������ 1', FALSE),
('9002', '������� ������ 1', FALSE),
('9003', '������� ������ 1', FALSE);

SELECT * FROM stock_location;

-- 2.4: ���������� ������������� ��������:

-- �������� �������:

DROP TABLE IF EXISTS transaction_directory;
CREATE TABLE transaction_directory (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  transaction_code CHAR(4) NOT NULL UNIQUE COMMENT '��� ����������', 
  transaction_name VARCHAR(50) NOT NULL COMMENT '������������ ����������'
 ) COMMENT='���������� ������������� ��������';

-- ������� ����� � �������:
-- ��� �������-����������. ��� ��� ��� FK. � ������� ��� �������� ��� ���� - id � transaction_code.
-- ������ ����� ��� ���������� �� ����.

-- �������� �������:
 
 INSERT INTO transaction_directory (transaction_code, transaction_name)
VALUES
('1000', '������ �� �����'),
('1020', '�������� �� ������������'),
('2020', '������'),
('2021', '������������ ��'),
('2050', '�������� �� �� �����'),
('5000', '�������� �������');

SELECT * FROM transaction_directory;

 
-- 2.5: ���������� ��������:

-- �������� �������:

DROP TABLE IF EXISTS recipies;
CREATE TABLE recipies (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fp_alpha_code CHAR(1) NOT NULL COMMENT '��������� ��������� �� �� ����������� ��',
  fp_num_code CHAR(10) NOT NULL COMMENT '�������� ��������� ��� �� �� ����������� ��',
  rp_alpha_code CHAR(1) NOT NULL COMMENT '��������� ��������� ��� �� ����������� ��',
  rp_num_code CHAR(10) NOT NULL COMMENT '�������� ��������� ��� �� ����������� ��',
  quantity_per_tn INT NOT NULL COMMENT '���������� ��� ��� ������������ 1 �� �� � ������� �� ���'
) COMMENT='���������� ��������';

-- ������� ����� � �������:
ALTER TABLE recipies 
  ADD CONSTRAINT recipies_fp_code_fk
    FOREIGN KEY (fp_alpha_code, fp_num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE;

CREATE INDEX recipies_articles_idx ON recipies(fp_alpha_code, fp_num_code, rp_alpha_code, rp_num_code);     
     
-- �������� �������:

TRUNCATE TABLE recipies; 

INSERT INTO recipies (fp_alpha_code, fp_num_code, rp_alpha_code, rp_num_code, quantity_per_tn)
VALUES
-- 'A', '4', '������� ������� ��������� ����� 210��'
('A', '4', 'R', '1', 400),
('A', '4', 'R', '2', 200),
('A', '4', 'R', '4', 200),
-- 'A', '10', '������� ��������� ������ � ������ 180��'
('A', '10', 'R', '1', 300),
('A', '10', 'R', '2', 150),
('A', '10', 'R', '4', 150),
('A', '10', 'R', '5', 150),
('A', '10', 'R', '7', 50);

SELECT * FROM recipies;


-- 2.6: ���������������� �����:

-- �������� �������: 

DROP TABLE IF EXISTS production_lines;
CREATE TABLE production_lines (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  location_code CHAR(4) NOT NULL COMMENT '��� ���������������� ����� (�� ����������� ����� ��������)', 
  output_per_hour INT COMMENT '������������������ ����� � ���', 
  units CHAR(4) COMMENT '��',
  employees_num INT COMMENT '���������� ��������� �� �����',
  hours_in_shift INT COMMENT '����������������� �����'
 ) COMMENT='���������� ���������������� ����� � ������������ ���������� ������������������';
-- ��������� ���� ����� ����� �������� NULL, ���� �� ����������� ������������ ��� ���������.

-- ������� �����:
ALTER TABLE production_lines 
  ADD CONSTRAINT pr_lines_location_code_fk
    FOREIGN KEY (location_code) REFERENCES stock_location(location_code) 	
      ON DELETE CASCADE,
  ADD CONSTRAINT pr_lines_unit_fk
    FOREIGN KEY (units) REFERENCES units(short_name)
      ON DELETE CASCADE;

-- �������� �������:

TRUNCATE TABLE production_lines; 

INSERT INTO production_lines (location_code, output_per_hour, units, employees_num, hours_in_shift)
VALUES
('2101', 2000, '��', 5, 11),
('2102', 1500, '��', 7, 11);

SELECT * FROM production_lines;

-- ������ ��������� � �������� ��������. 

-- 2.7. � ������� transactions � ��� ����� ��������� ����������� ��� ��������, ���������� �������� ��� � ��, 
-- �� ����������� ����� ������������ �� � �������� ��� �� ������������ �� (��� �������� ����� ���������� � 
-- ��������� ������� shift_report). �������� ��� ������� � ����� �� ��������.

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  transaction_date DATE NOT NULL COMMENT '���� ����������',
  transaction_code CHAR(4) NOT NULL COMMENT '��� ����������',
  location_from CHAR(4) NOT NULL COMMENT '������',
  lo�ation_to CHAR(4) NOT NULL COMMENT '����',
  alpha_code CHAR(1) NOT NULL COMMENT '��������� ��������� �������� �������',
  num_code CHAR(10) NOT NULL COMMENT '�������� ��������� �������� �������',
  quantity INT NOT NULL COMMENT '���������� ��'  
) COMMENT='������ ����������';

-- �������� ������� �����:
ALTER TABLE transactions 
  ADD CONSTRAINT transactions_transaction_code_fk
    FOREIGN KEY (transaction_code) REFERENCES transaction_directory(transaction_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT transactions_location_from_fk
    FOREIGN KEY (location_from) REFERENCES stock_location(location_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT transactions_location_to_fk
    FOREIGN KEY (lo�ation_to) REFERENCES stock_location(location_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT transactions_article_code_fk
    FOREIGN KEY (alpha_code, num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE;
     
-- �������� �������:
     
TRUNCATE TABLE transactions; 

INSERT INTO transactions (transaction_date, transaction_code, location_from, lo�ation_to, alpha_code, num_code,
  quantity)
VALUES
	('2021-01-11', '1000', '8001', '1100', 'R', '1', 100000),
	('2021-01-11', '1000', '8002', '1100', 'R', '2', 50000),
	('2021-01-11', '1000', '8004', '1100', 'R', '4', 50000),
	('2021-01-11', '1000', '8005', '1100', 'R', '5', 25000),
	('2021-01-11', '1000', '8003', '1100', 'R', '7', 10000),
	('2021-01-12', '1020', '1100', '2100', 'R', '1', 25000),
	('2021-01-12', '1020', '1100', '2100', 'R', '2', 15000),
	('2021-01-12', '1020', '1100', '2100', 'R', '4', 15000),
	('2021-01-12', '1020', '1100', '2100', 'R', '5', 7000),
	('2021-01-12', '1020', '1100', '2100', 'R', '7', 4000),
	('2021-01-13', '2050', '2100', '5100', 'A', '4', 20000),
	('2021-01-14', '2050', '2100', '5100', 'A', '10', 15000),
	('2021-01-19', '2050', '2100', '5100', 'A', '4', 21000),
	('2021-01-20', '2050', '2100', '5100', 'A', '10', 16000),
	('2021-01-26', '2050', '2100', '5100', 'A', '4', 22000),
	('2021-01-27', '2050', '2100', '5100', 'A', '10', 16500),
	('2021-01-15', '5000', '5100', '9001', 'A', '4', 5000),
	('2021-01-15', '5000', '5100', '9001', 'A', '10', 13000),
	('2021-01-21', '5000', '5100', '9002', 'A', '4', 20000),
	('2021-01-21', '5000', '5100', '9002', 'A', '10', 16000),
	('2021-01-28', '5000', '5100', '9003', 'A', '4', 18500),
	('2021-01-28', '5000', '5100', '9003', 'A', '10', 8000);

SELECT * FROM transactions; 

-- 2.8. ������� ����� �� ����� (ahift_report). �������� ������� �� ������������� �������� �� ������� ��������
-- � ���, ��� ����� �� ������ ������ � ������������ ������� ���������, ��� ����� ���������� ���������� � ���,
-- ����� ����� � � ����� ���������� �� ���������. ��� ���� ��� ����� ������ ��������� �� ����� (�������� �� ������
-- ������������ ��������������� �� �����). � � �� ������, ����� ��� ���������� ������������� ������������� (�� ����
-- � ��� ����� ������ �������, ������� ��� ��������� ������ � shift_report ����� ��������� ������ � ����������� 
-- ����� � transactions. ��� ����� ��� ����� ����� ������� ����� ��������� shift_report, ������� �������� ����������
-- �� ������ � ������������ ������� ���������, �� � � ������� ����� � �������� � ����������� ����� ������������. 

DROP TABLE IF EXISTS shift_report;
CREATE TABLE shift_report (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  transaction_date DATE NOT NULL COMMENT '���� ����������',
  transaction_code CHAR(4) NOT NULL COMMENT '��� ����������',
  location_code CHAR(4) NOT NULL COMMENT '��� ���������������� ����� (�� ����������� ����� ��������)',
  alpha_code CHAR(1) NOT NULL COMMENT '��������� ��� ��',
  num_code CHAR(10) NOT NULL COMMENT '�������� ��� ��',
  unicode VARCHAR(250) NOT NULL COMMENT '���������� (�������� ��� ������� ����� ������������, �� �� ��� 
  ������� � �����) ���, ������� ������������� ������ �������� �� ������������ �� (��� �������� ����� 
  ��������� �������� �������� ����� � ������ � ���������� �������� �� ������������ ��).' ,
  production INT COMMENT '����������� ��������� � ����� � �� �����', 
  employees_act INT COMMENT '����������� ���������� ����� �� ������',
  hours_act INT COMMENT '����������� ����������������� �����'
) COMMENT='����� �� ����� (����� �������� �����, ����� ���������, � ����� ������, �� ����� ������, �� ����� ����� 
� ����� ����������� ����� ���������, � ����� ����� ���������� ������ ����� � � ����� ������ ���������)';
-- ��������� ���� ����� ����� �������� NULL, ���� �� ����������� ������������ ��� ���������.

-- �������� ������� �����:
ALTER TABLE shift_report 
  ADD CONSTRAINT shr_transaction_code_fk
    FOREIGN KEY (transaction_code) REFERENCES transaction_directory(transaction_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT shr_location_code_fk
    FOREIGN KEY (location_code) REFERENCES stock_location(location_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT shr_article_code_fk
    FOREIGN KEY (alpha_code, num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE;

-- �������� �������:

TRUNCATE TABLE shift_report; 

INSERT INTO shift_report (location_code, transaction_date, transaction_code, alpha_code, num_code, unicode, production, employees_act, hours_act)
VALUES
-- A4
('2101', '2021-01-12', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 20000, 5, 11),
('2101', '2021-01-12', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-12', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-12', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-01-13', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 15000, 8, 11),
('2102', '2021-01-13', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-13', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 15000*(FLOOR(45 + RAND()*55)/1000), NULL, NULL),
-- A4
('2101', '2021-01-18', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 21000, 5, 11),
('2101', '2021-01-18', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 21000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-18', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 21000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-18', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 21000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-01-19', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 16000, 8, 11),
('2102', '2021-01-19', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-19', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 16000*(FLOOR(45 + RAND()*55)/1000), NULL, NULL),
-- A4
('2101', '2021-01-25', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 22000, 6, 11),
('2101', '2021-01-25', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 22000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-25', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 22000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-25', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 22000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-01-26', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 16500, 7, 11),
('2102', '2021-01-26', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-01-26', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 16500*(FLOOR(45 + RAND()*55)/1000), NULL, NULL),
-- A4
('2101', '2021-02-01', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 19000, 5, 11),
('2101', '2021-02-01', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 19000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-02-01', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 19000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-02-01', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 19000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
-- A10
('2102', '2021-02-02', '2021', 'A', '10', CONCAT(location_code, transaction_date, alpha_code, num_code), 14000, 7, 11),
('2102', '2021-02-02', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(250 + RAND()*350)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '5', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(125 + RAND()*175)/1000), NULL, NULL),
('2102', '2021-02-02', '2020', 'R', '7', CONCAT(location_code, transaction_date, 'A', '10'), 14000*(FLOOR(45 + RAND()*55)/1000), NULL, NULL);

SELECT * FROM shift_report;

-- � ����� �������� �������, ������� ����� ���������� ��������� � ������ ���������� ����� �� ������ ������������
-- ��������������� �� �����, � ������������� ��������� � ����� �� ����� ������������.
 
DROP TRIGGER IF EXISTS add_transfer;
CREATE TRIGGER add_transfer AFTER INSERT ON shift_report
FOR EACH ROW 
BEGIN 
IF (NEW.alpha_code = 'R') THEN
  	INSERT INTO transactions (transaction_code, transaction_date, location_from, lo�ation_to, alpha_code, num_code,
  		quantity)
  	VALUES
  	('2020', NEW.transaction_date, '2100', NEW.location_code, NEW.alpha_code, NEW.num_code, NEW.production);
END IF;
IF (NEW.alpha_code = 'A') THEN
  	INSERT INTO transactions (transaction_code, transaction_date, location_from, lo�ation_to, alpha_code, num_code,
  		quantity)
  	VALUES
  	('2021', NEW.transaction_date, NEW.location_code, '2100', NEW.alpha_code, NEW.num_code, NEW.production);
END IF;
END;

-- �������� ������ ��������:
INSERT INTO shift_report (location_code, transaction_date, transaction_code, alpha_code, num_code, unicode, production, employees_act, hours_act)
VALUES
-- A4
('2101', '2021-01-29', '2021', 'A', '4', CONCAT(location_code, transaction_date, alpha_code, num_code), 20000, 5, 11),
('2101', '2021-01-29', '2020', 'R', '1', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(350 + RAND()*450)/1000), NULL, NULL),
('2101', '2021-01-29', '2020', 'R', '2', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL),
('2101', '2021-01-29', '2020', 'R', '4', CONCAT(location_code, transaction_date, 'A', '4'), 20000*(FLOOR(175 + RAND()*225)/1000), NULL, NULL);

SELECT * FROM transactions;

-- �� �������� - ���� �� ������� ����� ������� �������� �� ���������� � ��������.

-- 2.9: ������� ��� (prices):
-- ����������, ��� ���������� ������. ���� �� �������� ����������. ���� �� ����� ������ ������������� �� ���������� 
-- ������ ����������, � ���� �� ������� ��������� - ���������� ����� �����������������. �� �� ������� ������� 
-- ������, � ������� ���� - ��������.
 
DROP TABLE IF EXISTS prices;
CREATE TABLE prices (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  alpha_code CHAR(1) NOT NULL COMMENT '��������� ��� ��',
  num_code CHAR(10) NOT NULL COMMENT '�������� ��� ��',
  article_unit_id INT UNSIGNED NOT NULL COMMENT 'ID �� ��� ������������', 
  price FLOAT COMMENT '���� �� ������� ���������',
  price_unit_id INT UNSIGNED NOT NULL COMMENT 'ID �� ��� ����'
  ) COMMENT='����';

 -- �������� ������� �����:
ALTER TABLE prices 
  ADD CONSTRAINT prices_article_code_fk
    FOREIGN KEY (alpha_code, num_code) REFERENCES articles(alpha_code, num_code)
      ON DELETE CASCADE,
  ADD CONSTRAINT prices_article_unit_id_fk
    FOREIGN KEY (article_unit_id) REFERENCES units(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT prices_price_unit_id_fk
    FOREIGN KEY (price_unit_id) REFERENCES units(id)
      ON DELETE CASCADE; 

ALTER TABLE prices 
  DROP CONSTRAINT prices_article_code_fk,
  DROP CONSTRAINT prices_article_unit_id_fk,
  DROP CONSTRAINT prices_price_unit_id_fk;  
 
 -- �������� �������:
 
 INSERT INTO prices 
	(alpha_code, num_code, article_unit_id, price, price_unit_id)
VALUES
	('A', '1', 1, 23.00, 2),
	('A', '2', 1, 24.50, 2),
	('A', '3', 1, 25.25, 2),
	('A', '4', 1, 28.00, 2),
	('A', '5', 1, 30.00, 2),
	('A', '6', 1, 30.00, 2),
	('A', '7', 1, 18.00, 2),
	('A', '8', 1, 20.00, 2),
	('A', '9', 1, 27.15, 2),
	('A', '10', 1, 28.45, 2),
	('A', '11', 1, 24.50, 2),
	('R', '1', 1, 15.00, 2),
	('R', '2', 1, 20.00, 2),
	('R', '3', 1, 40.00, 2),
	('R', '4', 1, 80.00, 2),
	('R', '5', 1, 25.00, 2),
	('R', '6', 1, 1500.00, 2),
	('R', '7', 1, 800.00, 2),
	('R', '8', 1, 150.00, 2),
	('R', '9', 1, 80.00, 2);

SELECT * FROM prices;

-- 3. ���������: 

-- 3.1 ������ ������� ������������ ������� ��������� �� ��������/������/������������

-- ��� ��������� ���������� ����������� ������� �� ����� ������� ������� VIEW.

SELECT * FROM shift_report; 

DROP VIEW IF EXISTS shift_analytics;
CREATE VIEW shift_analytics AS
	SELECT 
		shr.transaction_date AS 'pr_date',
		WEEK(shr.transaction_date) AS 'week_num',
		shr.location_code AS 'line',
		CONCAT(alpha_code, num_code) AS 'article', 
		pl.output_per_hour * shr.hours_act AS 'output_plan',
		shr.production AS 'output_act',
		pl.employees_num AS 'empl_plan',
		shr.employees_act AS 'empl_act'
	FROM shift_report shr
	JOIN production_lines pl ON shr.location_code = pl.location_code
	WHERE shr.alpha_code = 'A';

SELECT * FROM shift_analytics;


-- 3.1.1. ��������� ����������� ������������ �� ������ ����� �� ������� � ������� ��� � �����������
-- ���������:

SELECT * FROM shift_analytics; 

SELECT 
	IF(GROUPING(line) = 1, '��� �����', line) AS line,
	IF(GROUPING(week_num) = 1, '�����', week_num) AS 'Week �',
	SUM(output_plan) AS 'Plan, kg',
	SUM(output_act) AS 'Actual,kg',
	ROUND((SUM(output_act)/ SUM(output_plan) * 100),1) AS '%'
FROM shift_analytics
GROUP BY line, week_num
WITH ROLLUP;

-- 3.1.2 ��������� ������ ������������ �� ����� 2101 �� ������� �� ������ � ������� �� 
-- � ����������� ��������:

SELECT 
	IF(GROUPING(week_num)=1,'Total', week_num) AS week_num,
	SUM(output_plan) AS Output_plan,
	SUM(output_act) AS Output_act,
	ROUND((SUM(Output_act)/ SUM(Output_plan) * 100),2) AS 'Output, %'
FROM shift_analytics
WHERE Line = '2101' AND MONTH(pr_date) = 01
GROUP BY week_num
WITH ROLLUP;

-- 3.1.3 ��������� ������ ������������ ������� ��������� �� ���� �� ������:

SELECT 
	IF(GROUPING(article) = 1, '��� ������������', article) AS article,
	IF(GROUPING(pr_date) = 1, '�����', pr_date) AS pr_date,
	SUM(output_act) AS 'Actual,kg'	
FROM shift_analytics
GROUP BY article, pr_date
WITH ROLLUP;

-- 3.2. ��������� ������ ����� �� ������������ �� � ������� ��� � �����������:

-- ��� ��������� ���������� ����������� ���������, �������� VIEW:

SELECT * FROM shift_report; 

DROP VIEW IF EXISTS production;
CREATE VIEW production AS
	SELECT 
		transaction_date, 
		CONCAT(alpha_code, num_code) AS product, 
		production,
		unicode
FROM shift_report
WHERE alpha_code = 'A'; 

SELECT * FROM production;

DROP VIEW IF EXISTS material_usage;
CREATE VIEW material_usage AS
	SELECT 
		CONCAT(alpha_code, num_code) AS material, 
		production AS material_usage,
		unicode
FROM shift_report
WHERE alpha_code = 'R'; 

SELECT * FROM material_usage;

-- � ������ ������� ���� �������:
SELECT 
	transaction_date,
	product,
	material,
	r2.quantity_per_tn * production/1000 AS normative_usage , 
	material_usage AS actual_usage,
	ROUND((1 - material_usage / (r2.quantity_per_tn * production/1000))*100,1) AS 'difference, %'
FROM production p
JOIN material_usage mu ON p.unicode = mu.unicode
JOIN recipies r2 ON CONCAT(r2.fp_alpha_code, r2.fp_num_code) = product 
	AND CONCAT(r2.rp_alpha_code, r2.rp_num_code) = material
ORDER BY transaction_date; 

-- 3.3. �������� �� ����������� ������������ � ��� �������

-- ��� ����� � ������ ������� VIEW:
DROP VIEW IF EXISTS stock_calculation;
CREATE VIEW stock_calculation AS
SELECT 
	tr.transaction_date AS op_date, 
	tr.transaction_code AS operation_code,
	td.transaction_name AS operation,
	tr.location_from AS location_from,
	tr.lo�ation_to AS location_to, 
	CONCAT(tr.alpha_code, tr.num_code) AS article, 
	article_name AS article_name, 
	tr.quantity AS quantity,
	CASE WHEN tr.transaction_code = '1000' OR tr.transaction_code = '2021'  THEN tr.quantity ELSE
		CASE WHEN tr.transaction_code = '2020' OR tr.transaction_code = '5000' THEN tr.quantity * -1 ELSE 
		0 
		END 
	END AS stock_movement
FROM transactions tr 
JOIN transaction_directory td ON td.transaction_code = tr.transaction_code
JOIN articles ar ON CONCAT(ar.alpha_code, ar.num_code) = CONCAT(tr.alpha_code, tr.num_code) 
ORDER BY tr.transaction_date ;

SELECT * FROM stock_calculation WHERE article = 'R1';

-- 3.3.1. ������ ��������� ����� � �������� � ��������, ��������, �� ��������� ����:

SELECT 
	op_date,
	operation,
	quantity,
	COALESCE(SUM(stock_movement) OVER (ORDER BY op_date 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) AS stock 
FROM stock_calculation
WHERE article = 'R1';

-- 3.4. ��������� ����������� �������� ������������� � ������� �� � �����������:

SELECT 
	transaction_date,
	product,
	SUM(r2.quantity_per_tn * price / 1000) AS norm_cost_per_kg ,
	ROUND(SUM(material_usage * price / production),2) AS act_cost_per_kg
FROM production p
JOIN material_usage mu ON p.unicode = mu.unicode
JOIN recipies r2 ON CONCAT(r2.fp_alpha_code, r2.fp_num_code) = product 
	AND CONCAT(r2.rp_alpha_code, r2.rp_num_code) = material
JOIN prices pr ON CONCAT(pr.alpha_code, pr.num_code) = material
GROUP BY transaction_date, product
ORDER BY transaction_date; 

