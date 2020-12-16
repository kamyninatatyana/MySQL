-- ���� 2. ������� 2.
/* �������� ���� ������ example, ���������� � ��� ������� users, ��������� �� ���� ��������, 
 * ��������� id � ���������� name.
 */
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name CHAR(35) COMMENT '��� ������������'
);

INSERT INTO users VALUES 
	(NULL, '������ ���� ��������'),
	(NULL, '������ ���� ��������'),
	(NULL, '������� ����� ���������');

SELECT * FROM users;

-- ���� 2. ������� 3.
/* �������� ���� ���� ������ example �� ����������� �������, ���������� ���������� ����� 
 * � ����� ���� ������ sample.
 */
-- ��� ��������� ������ mysql:
-- mysqldump example > dump.sql
-- �� ��������� ������ mysql:
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;
SOURCE dump.sql;
SELECT * FROM sample;

-- ���� 2. ������� 4.
/*(�� �������) ������������ ����� �������� � ������������� ������� mysqldump. �������� ���� ������������ 
 * ������� help_keyword ���� ������ mysql. ������ ��������� ����, ����� ���� �������� ������ ������ 100 
 * ����� �������.
*/
-- ��� ��������� ������ mysql:
-mysqldump --where="true limit 100" mysql help_keyword > dump.sql
