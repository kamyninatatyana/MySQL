-- ���� 6

-- ������ 1. ���� �� � � �������� ���������� ������� ����� �� ���������� ����, � �� ��� ERP �������? 
-- ��� ��� �����. � �� ����� ��������.

-- ������ 2. ����������� �� ����������� ��: � ���������, �������� ���� �������� ������ � ������, ������� ���������� 
-- ����������������� ���� ������� �� ����������. ��� ����������� �� ���������� ������ � ������ ���� ���������:
-- ������� posts:
-- 1. Post_id
-- 2. Post_text
-- 3. Created_at
-- 4. Modified at
-- 5. User_id // Author user_id
-- 6. Reader_id // Reader user_id
-- 7. Reader_opinion_id
-- 8. Reader_transaction_id

-- ������� reader_opinion:
-- 1. Reader_opinion_id
-- 2. Reader_opinion (like, dislike, no opinion)

-- ������� reader_transaction:
-- 1. Reader_transation_id
-- 2. Reader_transaction (repost, etc.)

-- �� ��������, ��� � ����� �������� ���� �����������, ��� ��� ���� ���� ����� ������ ��������� ������� � � �����
-- ��������� �� �� ������ ����� ������� ����������. � ���� ������������, ��� ���� ���� ����� ������ ���������
-- ������� � �������, ��� � ���� ������ � ��� ��������� ��������� ���������� ������ (��������� ������ �������� ���
-- ���������������� �������� ����):

-- ������� posts:						������ 1			������ 2 			������ N
-- 1. Post_id								1					1					1
-- 2. Post_text
-- 3. Created_at
-- 4. Modified at
-- 5. User_id // Author user_id				1					1					2
-- 6. Reader_id // Reader user_id			2					3					3
-- 7. Reader_opinion_id
-- 8. Reader_transaction_id

-- �� ���� ������ ����� �������� ������ post_id + user_id + reader_id. ���� Post_id - �� �������� ����������. �����
-- ������� �� �������� (� ��� ������ ���� � ���� vk �������� ������� ��� primary key, � ������� �� ��������)? ���� �� 
-- � ������� � ������������ ������� ����� ���� �� ���� ������� (�����������) ���������� ����, ��, ����� �� � �������� 
-- ���� ����� (����, ����� �����, ���� ����) � ��������� �������. � ����� �� ������ �������� �� ���������� ������������� 
-- ��� ������ ������.

use vk;

-- 1. ������� � ��������� ������� ������ � ������.

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ��������� target_types:
INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');
 
-- ���������:
SELECT * FROM target_types;

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ��������� �����:
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

-- ���������:
SELECT * FROM likes;

-- ��������� posts:

-- ������ ���������, ����� ������� ������ �� ��������� ��������. 
DROP PROCEDURE IF EXISTS random_text;
CREATE PROCEDURE random_text(IN times INT, OUT rand_text VARCHAR(250))
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE str VARCHAR(250) DEFAULT '';
		WHILE i < times DO
		SET str = CONCAT(str, CHAR(FLOOR(97 + RAND() * (122 - 97 + 1)))); 
		SET i = i + 1;
		END WHILE;
	SET rand_text = str;
END;

-- ������ ��������� ����� �������� ��������������� ������
DROP PROCEDURE IF EXISTS insert_raws_with_rand_text;
CREATE PROCEDURE insert_raws_with_rand_text(IN raws INT)
BEGIN
	DECLARE counter INT DEFAULT 1;
	WHILE counter <= raws DO
	CALL random_text(5, @header);
	CALL random_text(100, @body);
	INSERT INTO posts (id, user_id, community_id, head, body, media_id, is_public, is_archived, created_at, updated_at)
	VALUES
  		(counter, 
    	FLOOR(1 + (RAND() * 100)), 
    	FLOOR(1 + (RAND() * 10)),
    	@header,
    	@body,
    	FLOOR(1 + (RAND() * 100)),
    	ROUND((RAND())),
    	ROUND((RAND())),
    	CURRENT_TIMESTAMP,
    	CURRENT_TIMESTAMP());
  	SET counter = counter + 1;
  	END WHILE;
END;

-- ��������� ���������� ���������
CALL insert_raws_with_rand_text(100);

-- ���������:
SELECT * FROM posts;

-- 2. ������� ��� ����������� ������� ����� � ��������� ��������� (15 ������).

-- ������ 3: ����� �� ��������� ������� users, �� ���������� ������� �� ��� ��� ���������� � ������� profiles,
-- ��� ��� �������, ��� � ���� ������� ����� ����� ���������� ���� ����� (��� ��� user_id ����� ����� �����)
-- � ����� �� ������� ������, ����� ��������� � ��� ���������. � ��� ���� primary_key - � ��� - ��� user id (id).
-- �� ���� ���� ���� - �����������, �������. ������ �� (���� 6, ������ 1 ��� 02 ���) - �� ������� ������� ���� 
-- � ��� ������� media � ��� ������� messages � ������� profiles. ������? 
-- ������ 4. � ����������� ������� 3. � ��� ������� profiles ��� ���� photo_id ����� ������� ���� � ������� media, 
-- � ������� media ����� ������� ���� ��� ���� user_id � ������� profiles (��� ��� �� ������ ��������� �� profiles). 
-- ��� �� �����������? ������ ������� ����������� ������. ������� ��������. ������� �� ����� ���� ���� ��� ����� � 
-- �������� � ���������� ������������. ��� ����? ���� �� ���������� ��������� �� users, ��� � ��� �� ���� 
-- ������ ���� ���� � ���� ������������ � ����� ������������ ������ �� �� ��������. ��� ����?

-- 2.1. communities
-- ��������������� �������, ��� ������� ������.   

SELECT * FROM communities;

-- 2.2. communities_users

SELECT * FROM communities;
SELECT * FROM communities_users;
SELECT * FROM profiles;

DESC profiles ;

ALTER TABLE communities_users 
  ADD CONSTRAINT communities_users_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id) 	-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE;
     
-- 2.3. contacts

SELECT * FROM contacts;
SELECT * FROM profiles;

ALTER TABLE contacts 
  ADD CONSTRAINT contacts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE;
     
-- 2.4. friendship

SELECT * FROM friendship;
SELECT * FROM profiles;
SELECT * FROM friendship_statuses;

ALTER TABLE friendship 
  ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES profiles(user_id)	-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)	-- NOT NULL
      ON DELETE CASCADE;
     
-- 2.5. friendship_statuses
-- ��������������� �������, ��� ������� ������

SELECT * FROM friendship_statuses;
     
-- 2.6. gender
-- ��������������� �������, ��� ������� ������

SELECT * FROM gender;

-- 2.7. likes

SELECT * FROM likes;
SELECT * FROM profiles;
SELECT * FROM target_types;

ALTER TABLE likes 
  ADD CONSTRAINT likes_user_id_fk
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id)	-- NOT NULL
      ON DELETE CASCADE;
 
-- 2.8. media

SELECT * FROM media;
SELECT * FROM profiles;
SELECT * FROM media_types;

ALTER TABLE media 
  ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)	-- NOT NULL
      ON DELETE CASCADE;

-- 2.9. media_types
-- ��������������� �������, ��� ������� ������

SELECT * FROM media;

-- 2.10. messages

SELECT * FROM messages;
SELECT * FROM profiles;

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE;

-- 2.11. posts

SELECT * FROM posts;
SELECT * FROM profiles;
SELECT * FROM communities;
SELECT * FROM media;

DESC media ; 

ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT posts_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id)	-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id)				-- NOT NULL
      ON DELETE CASCADE;

-- 2.12. profiles
-- � ���� ������-�� ��� ���� photo_id � ������� profiles. ������ ��� � ��������:

ALTER TABLE profiles 
	ADD photo_id INT UNSIGNED NOT NULL AFTER last_name;

UPDATE profiles p 
	SET p.photo_id = (SELECT id FROM media m WHERE m.media_type_id = 3 AND 
	m.user_id = p.user_id LIMIT 1);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;

-- �� ������ ������� ������� profiles � �������� gender
ALTER TABLE profiles 
	MODIFY gender_id INT UNSIGNED;
     
 ALTER TABLE profiles
  ADD CONSTRAINT profiles_gender_id_fk
    FOREIGN KEY (gender_id) REFERENCES gender(id)		-- NOT NULL
      ON DELETE CASCADE;
 
SELECT * FROM profiles;
SELECT * FROM gender;
DESC gender;
DESC profiles;

-- � ������� profiles � �������� user_statuses

SELECT * FROM profiles;
SELECT * FROM user_statuses;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_status_id_fk
    FOREIGN KEY (user_status_id) REFERENCES user_statuses(id)		-- NOT NULL
      ON DELETE CASCADE;

-- 2.13. target_types
-- ��������������� �������, ��� ������� ������

SELECT * FROM target_types;

-- 2.14. user_statuses
-- ��������������� �������, ��� ������� ������

SELECT * FROM user_statuses;

-- 2.15. users
-- ����������� �������. �� ����� ������� ������.

SELECT * FROM users;


-- 3. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

-- ���������, ����� ���� �����
SELECT * FROM likes;
SELECT * FROM profiles;
SELECT * FROM gender;

-- ��� ������. 

SELECT 
	g.gender AS Gender,
	COUNT(l.id) AS Number_of_likes
FROM gender g, profiles p, likes l
WHERE p.user_id = l.user_id AND g.id = p.gender_id 
GROUP BY p.gender_id ;

-- 4. ���������� ���������� ������ ������� �������� 10 ����� ������� �������������.

-- ���������, ����� ���� �����
SELECT * FROM likes;
SELECT * FROM profiles;

-- ��� ������:
SELECT
	COUNT(l.target_id) AS Number_of_likes,
	TIMESTAMPDIFF(YEAR, p.birthday, NOW()) AS Age, 
	p.user_id AS User_id,
	CONCAT(first_name, ' ', last_name) AS Name 
FROM likes l, profiles p
WHERE l.target_id = p.user_id
GROUP BY l.target_id
ORDER BY Age, Number_of_likes DESC, User_id 
LIMIT 10;

-- 5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ���� 
--    (�������� ���������� ���������� ���������� ��������������).

-- ����� ������� �������� - ��� ���� ���������� �����. ������������� �� ����, ������� 10 ����� ������ ������.
-- �� � ��� ������ ���� ���. �����, �������, ����������, ��� � ��� ��� ���� - updated_at � profiles, �� ��� ����
-- ��� �� ������� - � ������� ������ � � ���� ��� � ���� ����� ������ ���� �����. ����� �������� �� ���� ��� ����. 

-- � ������ �������� 4 ������ �������������:
-- 1) � ���� ��� ���������, 
-- 2) ��� �� ���� �� ������ ������,
-- 3) ��� �� ���� �� ������� �����,
-- 4) � ���� ��� ������.
-- � ����� ��� ������� ������������ ���������, � ����� ���������� �� ������������� ����� �� �����. � ���������� 
-- ��������� ��������� ���, ��� ����� � ���������� ���������� �����.

SELECT user_id, COUNT(*) AS Number_of_groups FROM
(SELECT p.user_id FROM profiles p
	WHERE NOT EXISTS (SELECT * FROM messages m WHERE p.user_id IN (m.from_user_id, m.to_user_id))  
UNION ALL 
SELECT p.user_id FROM profiles p
	WHERE NOT EXISTS (SELECT l.user_id FROM likes l WHERE p.user_id = l.user_id)
UNION ALL
SELECT p.user_id FROM profiles p
	WHERE NOT EXISTS (SELECT l.target_id FROM likes l WHERE p.user_id = l.target_id)
UNION ALL
SELECT p.user_id FROM profiles p
	WHERE NOT EXISTS (SELECT pt.user_id FROM posts pt WHERE p.user_id = pt.user_id)) AS union_table
GROUP BY user_id
ORDER BY Number_of_groups DESC, user_id
LIMIT 10;



