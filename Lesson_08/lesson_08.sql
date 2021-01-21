-- Урок 8
-- 1. Переделать внешние ключи на таблицу users
-- 2. Выполнить задания урока 6 с использованием JOIN.

use vk;
-- 1. Переделать внешние ключи на таблицу users.

-- 1.1. communities
-- Самостоятельная таблица, нет внешних ключей.   

SELECT * FROM communities;

-- 1.2. communities_users

SELECT * FROM communities;
SELECT * FROM communities_users;
SELECT * FROM users;

DESC profiles ;

ALTER TABLE communities_users 
  DROP FOREIGN KEY communities_users_user_id_fk;

ALTER TABLE communities_users 
  ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE;
     
-- 1.3. contacts

SELECT * FROM contacts;
SELECT * FROM users;

ALTER TABLE contacts 
  DROP FOREIGN KEY contacts_user_id_fk;
         
ALTER TABLE contacts 
  ADD CONSTRAINT contacts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE;
     
-- 1.4. friendship

SELECT * FROM friendship;
SELECT * FROM users;
SELECT * FROM friendship_statuses;

ALTER TABLE friendship 
  DROP FOREIGN KEY friendship_user_id_fk,
  DROP FOREIGN KEY friendship_friend_id_fk;
     
ALTER TABLE friendship 
  ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users(id)	-- NOT NULL
      ON DELETE CASCADE;
     
-- 1.5. friendship_statuses
-- Самостоятельная таблица, нет внешних ключей

SELECT * FROM friendship_statuses;
     
-- 1.6. gender
-- Самостоятельная таблица, нет внешних ключей

SELECT * FROM gender;

-- 1.7. likes

SELECT * FROM likes;
SELECT * FROM users;
SELECT * FROM target_types;

ALTER TABLE likes 
  DROP FOREIGN KEY likes_user_id_fk;

ALTER TABLE likes 
  ADD CONSTRAINT likes_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
 
-- 1.8. media

SELECT * FROM media;
SELECT * FROM users;
SELECT * FROM media_types;

ALTER TABLE media 
  DROP FOREIGN KEY media_user_id_fk;
     
ALTER TABLE media 
  ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
   
-- 1.9. media_types
-- Самостоятельная таблица, нет внешних ключей

SELECT * FROM media;

-- 1.10. messages

SELECT * FROM messages;
SELECT * FROM users;

ALTER TABLE messages
  DROP FOREIGN KEY messages_from_user_id_fk,
  DROP FOREIGN KEY messages_to_user_id_fk;
     
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE,
  ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE;
     
-- 1.11. posts

SELECT * FROM posts;
SELECT * FROM users;
SELECT * FROM communities;
SELECT * FROM media;

DESC media ; 

ALTER TABLE posts
  DROP FOREIGN KEY posts_user_id_fk;
     
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)		-- NOT NULL
      ON DELETE CASCADE;

-- 1.12. profiles

-- здесь все правильно было   

-- 1.13. target_types
-- Самостоятельная таблица, нет внешних ключей

SELECT * FROM target_types;

-- 1.14. user_statuses
-- Самостоятельная таблица, нет внешних ключей

SELECT * FROM user_statuses;

-- 1.15. users
-- Изначальная таблица. Не имеет внешних ключей.

SELECT * FROM users;


-- 2. 
-- 2.1. Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- Посмотрим, какие поля взять
SELECT * FROM likes;
SELECT * FROM profiles;
SELECT * FROM gender;

-- Сам запрос. 

-- Было:
SELECT 
	g.gender AS Gender,
	COUNT(l.id) AS Number_of_likes
FROM gender g, profiles p, likes l
WHERE p.user_id = l.user_id AND g.id = p.gender_id 
GROUP BY p.gender_id ;

-- Стало:
SELECT 
	g.gender AS Gender,
	COUNT(l.id) AS Number_of_likes
FROM likes l
JOIN profiles p ON p.user_id = l.user_id
JOIN gender g ON p.gender_id = g.id
GROUP BY p.gender_id ;

-- 2.2. Подсчитать количество лайков которые получили 10 самых молодых пользователей.

-- Посмотрим, какие поля взять
SELECT * FROM likes;
SELECT * FROM target_types;
SELECT * FROM profiles;

-- Сам запрос:
-- Было:
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

-- Стало:
-- Выводим 10 самых молодых пользователей и количество лайков, которое они получили за всю свою активность.
SELECT
	COUNT(l.user_id) as number_of_likes,
	CONCAT(p.first_name, ' ', p.last_name) AS Name,
	p.birthday
FROM likes l 
JOIN profiles p ON p.user_id = l.target_id
GROUP BY Name, p.birthday 
ORDER BY p.birthday DESC
LIMIT 10; 

-- Выводим общий итог по запросу выше:
SELECT
	SUM(number_of_likes)
FROM (
	SELECT
	COUNT(l.user_id) as number_of_likes,
	CONCAT(p.first_name, ' ', p.last_name) AS Name,
	p.birthday
FROM likes l 
JOIN profiles p ON p.user_id = l.target_id
GROUP BY Name, p.birthday 
ORDER BY p.birthday DESC
LIMIT 10) AS total; 

-- 2.3. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети 
--    (критерии активности необходимо определить самостоятельно).

-- Я решила отобрать 4 группы пользователей:
-- 1) у кого нет сообщений, 
-- 2) кто ни разу не ставил лайков,
-- 3) кто ни разу не получал лайки,
-- 4) у кого нет постов.
-- А затем для каждого пользователя посчитать, в какое количество из перечисленных групп он попал. И определить 
-- наименеее активными тех, кто попал в наибольшее количество групп.

-- Было:
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

-- Решила переделать, как в уроке (выбирать не тех у кого ничего нет, а просто выбрать пользователей с наименьшим
-- количеством значений по тем же параметрам).
-- Стало: 

SELECT * FROM posts;
SELECT * FROM likes;
SELECT * FROM messages;

SELECT 
	id,
	SUM(total_activity) AS total 
FROM
	(SELECT 
		u.id,
		COUNT(likes_received.target_id) AS total_activity
	FROM users u
	LEFT JOIN likes AS likes_received ON likes_received.user_id = u.id
	GROUP BY u.id
UNION ALL
	SELECT 
		u.id,
		COUNT(likes_sent.user_id) AS total_activity
	FROM users u
	LEFT JOIN likes AS likes_sent ON likes_sent.target_id = u.id
	GROUP BY u.id
UNION ALL
	SELECT 
	u.id,
	COUNT(p.user_id) AS total_activity
	FROM users u
	LEFT JOIN posts AS p ON p.user_id = u.id
	GROUP BY u.id
UNION ALL
	SELECT 
	u.id,
	COUNT(messages_sent.from_user_id) AS total_activity
	FROM users u
	LEFT JOIN messages AS messages_sent ON messages_sent.from_user_id = u.id
	GROUP BY u.id
UNION ALL
	SELECT 
	u.id,
	COUNT(messages_received.to_user_id) AS total_activity
	FROM users u
	LEFT JOIN messages AS messages_received ON messages_received.to_user_id = u.id
	GROUP BY u.id
	) AS total
GROUP BY id
ORDER BY total 
LIMIT 10;


-- также у меня был вот такой вариант:
SELECT 
	u.id, 
	COUNT(p.user_id) AS number_of_posts ,
	(SELECT COUNT(l.target_id) FROM likes l WHERE l.target_id = u.id) AS likes_received,
	COUNT(ls.user_id) AS likes_sent, 
	(SELECT COUNT(m.from_user_id) FROM messages m WHERE m.from_user_id = u.id) AS messages_sent,
	COUNT(m2.to_user_id ) AS messages_received
FROM users u 
LEFT JOIN posts p ON p.user_id = u.id
LEFT JOIN likes ls ON ls.user_id = u.id 
LEFT JOIN messages m2 ON m2.to_user_id = u.id 
GROUP BY u.id;      

-- но здесь я не смогла сделать итоговый столбец, где бы суммировались значения предыдущих. Подскажите, пожалуйста,
-- как это можно правильно сделать.

	