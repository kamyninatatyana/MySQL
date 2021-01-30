-- ���� 10:

-- �� �� vk:

-- 1. ����������������, ����� ������� ����� ����������� �������� ����� � �������� ������ ����������, 
-- � �������� ����������� �������.

USE vk;

-- � �������� �� ���������� �������������: ���� �� ���� ��� ���������� PK ��� FK, �� ������ ������ ��� ����
-- ������ - ���. ����� ���� �� ��� ����, ��� ������� �������� �� ������� ��������� ������ ����������� ���
-- �������������� FK - �� ������ ��������� ������ ����� ��� ������.

-- 1. ������� communities:

SELECT * FROM communities;

-- ��������� - � ��� ����� ������������ ����, �� �������� ����� ���� �� ������� ������ - ��� �������� ������. 
-- �� � �� �� ����� ��������� ������ � ���� ������� � ��������, ��� ��� ����������� ����, ��� �� ����� �������������
-- �����-�� ���������� ������ (��� ���� ��� �� ������������ �� ����� �� �����) - ��������. ������ ��� ����� 
-- ������������ ������ � ���������� ����������� ���, ��������, ����� ������ ����������� ������, �� ���� ������,
-- � ����������� �����������, � �� ������. 

-- 2. ������� communities_users:
 
SELECT * FROM communities_users;
DESC communities_users;

-- ����� ��������� PRIMARY KEY �� ����� community_id � user_id.

-- 3. ������� contacts:

SELECT * FROM contacts;

-- ����� ������� ���� �� ���� contact_info:
DESC contacts; 
-- � ���� ���� contact_info ������ �� ����� ����� varchar(1000). �� ����, ������ ��� ����������. 
-- ������, ���� ��������. �� ����� ���� ������ �� ���������. ������� ����� ��� ��������:

ALTER TABLE contacts 
	MODIFY COLUMN contact_info VARCHAR(50);

-- ������ ����� ������� ������:

CREATE INDEX contacts_info_idx ON contacts(contact_info);

-- 4. ������� friendship:

SELECT * FROM friendship;

-- � ��� ��� ������ PK �� ���� user_id � FK ��� ����� friend_id � status_id. ������ �����, ��� ������� 
-- ������ �� ��������� ���� ���.

-- 5. ������� friendship_statuses:
  
SELECT * FROM friendship_statuses;
DESC friendship_statuses;

-- PK - id, UNI - name. ������ ����� ��� ���������� ���.

-- 6. ������� gender:

SELECT * FROM gender;

-- � �� ���� ������ ����� ���-�� �������������.

-- 7. ������� likes:

SELECT * FROM likes;

-- PK - id, FK - target_type_id, user_id. � �������� ����� ������� ������ �� ���� target_id:

CREATE INDEX likes_targ_id_idx ON likes(target_id);

-- 8. ������� media:
 
SELECT * FROM media;

-- PK - id, FK - type_id, user_id. ������������� ����� ������� ������ �� ���� filename, �� � �� �����, ��� 
-- ��������, ����� ��� ����� ����� ���� � ���������� ������ ����� �������� ������������� ��������� �����. 
-- �����, ���� ����� ������� ������ ���������, �� ��� �������� �����.

-- 9. ������� media_types:

SELECT * FROM media_types;

-- � ���� ������� ��� ������ ��������� �������.

-- 10. ������� messages:

SELECT * FROM messages;

-- PK - id, FK - from_user_id, to_user_id. � �� ���� ����� ������ ��������, ��� ������� ������ �� ������� ������.
-- (������������� ����� ��� is_important � is_delivered, �� ������ �� ����).

-- 11. ������� posts:

SELECT * FROM posts;

-- PK - id, FK - community_id, media_id, user_id. � �� ���� ������ �����, ��� ������� ����� �� ����� ������� �������.

-- 12. ������� profiles:

SELECT * FROM profiles;

-- PK - user_id, FK - gender_id, photo_id, user_status_id. ����� ������������� ��������� �� ������� ��� �������.
-- �������� ��� �����:

CREATE INDEX pr_country_idx ON profiles(country);
CREATE INDEX pr_city_idx ON profiles(city);

-- 13. ������� target_types:

SELECT * FROM target_types;

-- PK - id, UNI - name. ��� ��������, ����� ������� ������.

-- 14. ������� user_statuses:

SELECT * FROM user_statuses;

-- ���� � ��������� �������, �� ��������� � ���� ������� ��� ������ ������� ������ �� name (��� ��� ��� ����������), � � ���������� - ������������, ��� �� ����� ���-�� ������. �� ������ ����� ������ ���-�� � 
-- profiles, �� id �������. �� ����� ������� ��� ���� UNIQUE, ��� ��� � ������ ���� - ������. 

DESC user_statuses; 

ALTER TABLE user_statuses 
	MODIFY COLUMN name VARCHAR(50) UNIQUE;

-- 15. ������� users:

SELECT * FROM users;
DESC users;

-- � ���� � ���� ������� ���� email � phone - UNI. ������ ����� ��� �������� ������� ���.

-- 2. ������� �� ������� �������. ��������� ������, ������� ����� �������� ��������� �������:
-- ��� ������
-- ������� ���������� ������������� � �������
-- ����� ������� ������������ � ������
-- ����� ������� ������������ � ������
-- ����� ���������� ������������� � ������
-- ����� ������������� � �������
-- ��������� � ��������� (����� ���������� ������������� � ������ / ����� ������������� � �������) * 100

SELECT * FROM communities;
SELECT * FROM communities_users;

-- � ���������� ������� ���� ������ � communities_users - ����� ����� ������� � ���� ������� �� ��������� � 
-- ����� ����������� �������������

SELECT 
	DISTINCT c.name as community, 
	COUNT(*) OVER () / (SELECT COUNT(*) FROM communities c) AS avg_users_in_group,
	first_value(CONCAT(p.first_name, ' ', p.last_name)) 
		OVER (PARTITION BY cu.community_id ORDER BY p.birthday DESC) AS yangest_in_group,
	last_value(CONCAT(p.first_name, ' ', p.last_name)) 
		OVER (PARTITION BY cu.community_id ORDER BY p.birthday DESC 
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS oldest_in_group,
	(COUNT(*) OVER (PARTITION BY cu.community_id)) AS users_in_group,
	(SELECT COUNT(p.user_id) FROM profiles p) AS users_in_system,
	(COUNT(*) OVER (PARTITION BY cu.community_id)) / (SELECT COUNT(p.user_id) FROM profiles p) * 100 AS '%' 
FROM communities_users cu 
JOIN profiles p ON cu.user_id = p.user_id
JOIN communities c ON c.id = cu.community_id; 

